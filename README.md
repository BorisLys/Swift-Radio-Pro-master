# Swift-Radio-Pro-master
## Project for Learning XCTest and Improving Test Automation Skills

This project using the Page Object pattern and includes three folders in the target containing UI tests:

1. 	**Page** - Contains classes with variable and method descriptions for specific screens.
2.	**Tests** - Contains classes with ui-tests.
3.	**Extensions** - Contains extensions for XCUIElement to eliminate code duplication in methods from the Page folder. It also includes an extension for specific tests to handle system alerts.

A total of 15 tests have been written to verify the main scenarios identified during exploratory testing of the application.

You can view the CI test run results [here](https://borislys.github.io/Swift-Radio-Pro-master/) 

## AI-powered pull request reviews

This repository ships with an automated pull request review workflow powered by a configurable LLM.
The workflow lives in `.github/workflows/ai-pr-review.yml` and runs on every non-draft pull request.

To enable the workflow you need to provide the following GitHub repository secrets:

- `OPENAI_API_KEY` – API key for an OpenAI-compatible service.
- `OPENAI_MODEL` – (Optional) model identifier, defaults to `gpt-4o-mini` if omitted.
- `OPENAI_API_BASE` – (Optional) custom base URL, useful when working with Azure/OpenAI-compatible services.

Once the secrets are configured, the workflow calls `scripts/ai_pr_reviewer.py` to collect the PR
metadata, send it to the model, and publish the generated review as a comment on the pull request.
You can also run the script locally if you have the required environment variables set:

```bash
python scripts/ai_pr_reviewer.py --repo <owner/repo> --pr-number <number>
```

Add the `--post-comment` flag to let the script publish the review back to GitHub after the
analysis finishes.
