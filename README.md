# allure-publish-action

GitHub action to publish allure report in cloud provider of choice using [allure-report-publisher](https://github.com/andrcuns/allure-report-publisher)

By default this action will upload a test report to cloud provider bucket and add test result summary and link to report in the [job summary](https://docs.github.com/en/actions/using-workflows/workflow-commands-for-github-actions#adding-a-job-summary)

## Inputs

- `storageType`: required: `true`, Cloud storage type (s3/gcp)
- `resultsGlob`: required: `false`,  Allure results files glob pattern, default: `./**/allure-results`
- `bucket`: required: `true`, Bucket name
- `prefix`: required: `false`, Optional prefix for report path as stored in the bucket, default: `none`
- `baseUrl`: required: `false`, Custom base url for report link, example: `http://my-custom-url`, default: `none`
- `config`: required: `false`, Path to custom allure configuration file, default: `none`
- `updatePr`: required: `false`,  Add report url and test result to pr or actions summary (comment/description/actions), default: `actions`
- `summary`: required: `false`, Additionally add summary table of test results, default: `true`
- `collapseSummary`: required: `false`, Create summary table as a collapsible section, default: `false`
- `reportTitle`: required: `false`, Custom report title for PR comment/description/actions section, default: `Allure Report`
- `copyLatest`: required: `false`, Keep copy of latest report at base prefix path (static url to latest test execution), default: `false`
- `ignoreMissingResults`: required: `false`, Ignore missing allure results and exit with 0 status code, default: `false`
- `flakyWarningStatus`: required: `false`, Use '!' status emoji when flaky tests are present in report, default: `false`
- `color`: required: `false`, Force color output, default: `true`
- `debug`: required: `false`, Add debug log output, default: `false`
- `parallel`: required: `false`, Number of parallel threads to use for report file upload to cloud storage, default: `8`
- `reportName`: required: `false`, Custom report name, default: `Test Report`

## Environment variables

Action requires 2 environment variable types to be set up

### Github auth token

Github auth token for pull request updates if `updatePr` is set to `comment` or `description`

```yml
env:
  GITHUB_AUTH_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

### Cloud auth token

Depending on cloud provider used, one of the environment variables for authentication has to be set:

- [AWS](https://github.com/andrcuns/allure-report-publisher#aws-s3)

```yml
env:
  AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
  AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
```

- [GCP](https://github.com/andrcuns/allure-report-publisher#google-cloud-storage)

```yml
env:
  GOOGLE_APPLICATION_CREDENTIALS: ${{ secrets.GOOGLE_APPLICATION_CREDENTIALS  }}
```

## Example

```yml
steps:
  - name: Publish allure report
    uses: andrcuns/allure-publish-action@v3.2.0
    env:
      AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
      AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
      GITHUB_AUTH_TOKEN: ${{ secrets.GITHUB_TOKEN }}
    with:
      storageType: s3
      resultsGlob: "path/to/allure-results"
      bucket: allure-test-reports
      prefix: $GITHUB_REF
      copyLatest: true
      ignoreMissingResults: true
```
