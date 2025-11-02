#!/usr/bin/env python3
"""AI-powered pull request reviewer script.

This script fetches pull request metadata and diff content from the GitHub API
and sends the information to an LLM provider (OpenAI-compatible API) for an
automated review. The resulting feedback can either be printed to stdout or
posted back to the pull request as a comment.

Usage example:
    python scripts/ai_pr_reviewer.py --repo owner/repo --pr-number 42 --post-comment

Required environment variables:
    GITHUB_TOKEN      - token with permissions to read PR metadata and post comments.
    OPENAI_API_KEY    - API key for the OpenAI compatible endpoint.

Optional environment variables:
    OPENAI_MODEL      - model identifier (defaults to ``gpt-4o-mini``).
    OPENAI_API_BASE   - base URL for the API (defaults to OpenAI public endpoint).

The script has intentionally few dependencies and uses the Python standard
library for HTTP requests so it can run in CI environments without additional
setup apart from installing Python itself.
"""

from __future__ import annotations

import argparse
import json
import os
import sys
import textwrap
from typing import Iterable, List
from urllib import error, request

DEFAULT_MODEL = "gpt-4o-mini"
DEFAULT_MAX_CHARS_PER_MESSAGE = 14_000


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Run an AI review on a pull request")
    parser.add_argument("--repo", required=True, help="GitHub repository in the form owner/name")
    parser.add_argument("--pr-number", required=True, type=int, help="Pull request number")
    parser.add_argument(
        "--model",
        default=os.environ.get("OPENAI_MODEL", DEFAULT_MODEL),
        help="LLM model identifier (defaults to environment variable OPENAI_MODEL or gpt-4o-mini)",
    )
    parser.add_argument("--temperature", default=0.2, type=float, help="Sampling temperature for the LLM call")
    parser.add_argument(
        "--max-chars",
        default=DEFAULT_MAX_CHARS_PER_MESSAGE,
        type=int,
        help="Maximum characters to include in a single diff chunk",
    )
    parser.add_argument(
        "--post-comment",
        action="store_true",
        help="Post the generated review as a PR comment instead of only printing it",
    )
    return parser.parse_args()


def require_env(name: str) -> str:
    value = os.environ.get(name)
    if not value:
        raise SystemExit(f"Environment variable {name} is required")
    return value


def github_request(path: str, *, headers: dict[str, str] | None = None) -> bytes:
    token = require_env("GITHUB_TOKEN")
    url = f"https://api.github.com{path}"
    req = request.Request(url)
    req.add_header("Authorization", f"token {token}")
    req.add_header("User-Agent", "swift-radio-ai-reviewer")
    req.add_header("Accept", "application/vnd.github.v3+json")
    if headers:
        for key, value in headers.items():
            req.add_header(key, value)
    try:
        with request.urlopen(req) as response:
            return response.read()
    except error.HTTPError as exc:
        message = exc.read().decode("utf-8", errors="replace")
        raise SystemExit(f"GitHub API request failed: {exc.code} {exc.reason}\n{message}") from exc


def fetch_pr_metadata(repo: str, pr_number: int) -> dict:
    data = github_request(f"/repos/{repo}/pulls/{pr_number}")
    return json.loads(data)


def fetch_pr_diff(repo: str, pr_number: int) -> str:
    diff_bytes = github_request(
        f"/repos/{repo}/pulls/{pr_number}", headers={"Accept": "application/vnd.github.v3.diff"}
    )
    return diff_bytes.decode("utf-8", errors="replace")


def chunk_text(text: str, size: int) -> Iterable[str]:
    if size <= 0:
        yield text
        return
    for start in range(0, len(text), size):
        yield text[start : start + size]


def build_messages(pr_data: dict, diff: str, args: argparse.Namespace) -> List[dict[str, str]]:
    system_prompt = textwrap.dedent(
        """
        You are an experienced software engineer helping review pull requests. Assess the
        provided diff for potential bugs, regressions, missing tests, style issues, and any
        other actionable feedback. If everything looks good, explicitly state that no
        blocking issues were found. Keep the review focused on what is shown in the diff.
        Provide structured bullet points under headings "Summary", "Concerns", and
        "Suggested actions". Leave a heading empty if there are no items for it.
        """
    ).strip()

    pr_summary = textwrap.dedent(
        f"""
        Repository: {args.repo}
        PR: #{pr_data.get('number')} - {pr_data.get('title')}
        Author: {pr_data.get('user', {}).get('login', 'unknown')}
        Base: {pr_data.get('base', {}).get('label')}
        Head: {pr_data.get('head', {}).get('label')}

        Pull request description:
        {pr_data.get('body') or '(No description provided)'}
        """
    ).strip()

    messages: List[dict[str, str]] = [{"role": "system", "content": system_prompt}]
    messages.append({"role": "user", "content": pr_summary})

    for index, chunk in enumerate(chunk_text(diff, args.max_chars), start=1):
        header = f"Diff chunk {index}:\n" if diff else ""
        messages.append({"role": "user", "content": header + chunk})
    return messages


def call_openai(messages: List[dict[str, str]], *, model: str, temperature: float) -> str:
    api_key = require_env("OPENAI_API_KEY")
    api_base = os.environ.get("OPENAI_API_BASE", "https://api.openai.com/v1")
    url = f"{api_base.rstrip('/')}/chat/completions"

    payload = json.dumps(
        {
            "model": model,
            "messages": messages,
            "temperature": temperature,
        }
    ).encode("utf-8")

    req = request.Request(url, data=payload, method="POST")
    req.add_header("Authorization", f"Bearer {api_key}")
    req.add_header("Content-Type", "application/json")

    try:
        with request.urlopen(req) as response:
            body = response.read().decode("utf-8")
    except error.HTTPError as exc:
        error_body = exc.read().decode("utf-8", errors="replace")
        raise SystemExit(f"OpenAI API request failed: {exc.code} {exc.reason}\n{error_body}") from exc

    data = json.loads(body)
    try:
        return data["choices"][0]["message"]["content"].strip()
    except (KeyError, IndexError, TypeError) as exc:
        raise SystemExit(f"Unexpected response from OpenAI API: {body}") from exc


def post_comment(repo: str, pr_number: int, body: str) -> None:
    token = require_env("GITHUB_TOKEN")
    url = f"https://api.github.com/repos/{repo}/issues/{pr_number}/comments"
    payload = json.dumps({"body": body}).encode("utf-8")

    req = request.Request(url, data=payload, method="POST")
    req.add_header("Authorization", f"token {token}")
    req.add_header("User-Agent", "swift-radio-ai-reviewer")
    req.add_header("Accept", "application/vnd.github.v3+json")
    req.add_header("Content-Type", "application/json")

    try:
        with request.urlopen(req) as response:
            response.read()
    except error.HTTPError as exc:
        message = exc.read().decode("utf-8", errors="replace")
        raise SystemExit(f"Failed to post GitHub comment: {exc.code} {exc.reason}\n{message}") from exc


def main() -> int:
    args = parse_args()
    pr_data = fetch_pr_metadata(args.repo, args.pr_number)
    diff = fetch_pr_diff(args.repo, args.pr_number)
    messages = build_messages(pr_data, diff, args)
    review = call_openai(messages, model=args.model, temperature=args.temperature)

    if args.post_comment:
        post_comment(args.repo, args.pr_number, review)
        print("AI review posted as a PR comment.")
    else:
        print(review)
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except SystemExit as exc:
        if exc.code not in (None, 0):
            print(exc, file=sys.stderr)
        raise
