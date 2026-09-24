# Swift-Radio-Pro-master
## Project for Learning XCTest and Improving Test Automation Skills

This project uses the Page Object pattern. The UI test target `SwiftRadioUITests` contains the following folders:

1. 	**Page** - Contains classes with variable and method descriptions for specific screens.
2.	**Tests** - Contains classes with ui-tests.
3.	**Extensions** - Contains extensions for XCUIElement to eliminate code duplication in methods from the Page folder. It also includes an extension for specific tests to handle system alerts.
4.	**Data** - Contains test data.
5.	**Test Plans** - Contains the `Smoke` and `Regression` test plans.

A total of 22 UI tests have been written to verify the main scenarios identified during exploratory testing of the application. The `SwiftRadioTests` target contains examples of Swift Testing tests.

## Allure Report

Test results are reported with [Allure Report 3](https://allurereport.org/docs/v3/). Test metadata (epic, feature, severity, attachments, etc.) is added with the [allure-swift](https://github.com/BorisLys/allure-swift) package: `AllureXCTest` for XCTest and `AllureSwiftTesting` for Swift Testing.

**Latest CI test run report: https://borislys.github.io/Swift-Radio-Pro-master/**

The report is built by the [Github cloud run test](.github/workflows/test.yaml) workflow, which runs every Monday or manually with the `Smoke` or `Regression` test plan. It is published to GitHub Pages from the `gh-pages` branch. The history of the last 20 runs is stored in `history.jsonl` in the same branch, so the report shows trends between runs.

The report settings are in [allurerc.mjs](allurerc.mjs).

### Generate a report locally

Install Allure 3 (requires Node.js):

```bash
npm install -g allure
```

`allure-swift` writes Allure metadata into the `.xcresult` bundle, so run the tests with a result bundle path:

```bash
xcodebuild test -project SwiftRadio.xcodeproj -scheme SwiftRadioUITests -testPlan Smoke -destination 'platform=iOS Simulator,name=iPhone 16' -resultBundlePath TestResults.xcresult
```

Convert the bundle to Allure results with [xcresults](https://github.com/eroshenkoam/xcresults/releases):

```bash
xcresults export TestResults.xcresult -o allure-results
```

Generate and open the report:

```bash
allure generate allure-results --config allurerc.mjs
```

```bash
allure open allure-report
```
