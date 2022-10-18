# allure-publish-action

GitHub action to publish allure report in cloud provider of choice using [allure-report-publisher](https://github.com/andrcuns/allure-report-publisher)

By default this action will upload a test report to cloud provider bucket and add test result summary and link to report in the [job summary](https://docs.github.com/en/actions/using-workflows/workflow-commands-for-github-actions#adding-a-job-summary)

## Inputs

- `storageType`: required: `true`, Cloud storage type (s3/gcp)
- `resultsGlob`: required: `true`,  Allure results files glob pattern
- `bucket`: required: `true`, Bucket name
- `prefix`: required: `false`, Optional prefix for report path as stored in the bucket, default: `none`
- `updatePr`: required: `false`,  Add report url and test result to pr or actions summary (comment/description/actions), default: `actions`
- `summary`: required: `false`, Additionally add summary table of test results (behaviors/suites/packages/total), default: `total`
- `summaryTableType`: required: `false`, Summary table type (ascii/markdown), default: `markdown`
- `collapseSummary`: required: `false`, Create summary table as a collapsable section, default: `false`
- `copyLatest`: required: `false`, Keep copy of latest report at base prefix path (static url to latest test execution), default: `false`
- `ignoreMissingResults`: required: `false`, Ignore missing allure results and exit with 0 status code, default: `false`
- `color`: required: `false`, Force color output, default: `true`
- `debug`: required: `false`, Add debug log output, default: `false`

## Environment variables

Action requires 2 environment variables to be set up

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
  GOOGLE_CLOUD_CREDENTIALS_JSON: ${{ secrets.GOOGLE_CLOUD_CREDENTIALS_JSON }}
```

## Example

```yml
steps:
  - name: Publish allure report
    uses: andrcuns/allure-publish-action@v2.0.1
    env:
      GOOGLE_CLOUD_CREDENTIALS_JSON: ${{ secrets.GOOGLE_CLOUD_CREDENTIALS_JSON }}
      GITHUB_AUTH_TOKEN: ${{ secrets.GITHUB_TOKEN }}
    with:
      storageType: gcs
      resultsGlob: "path/to/allure-results"
      bucket: allure-test-reports
      prefix: $GITHUB_REF
      copyLatest: true
      ignoreMissingResults: true
```
