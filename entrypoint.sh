#!/bin/sh

PARSED_ARGUMENTS=$(
  getopt \
    -o g:b:p:u:t:s:m:r:l:i:f:c:d:q:n: \
    --long results-glob:,bucket:,prefix:,update-pr:,add-summary:,collapse-summary:,ci-report-title:,copy-latest:,ignore-missing-results:,flaky-warning-status:,color:,debug:,base-url:,parallel:,report-name:,config: \
    -- "$@"
)

eval set -- "$PARSED_ARGUMENTS"
while :; do
  case "$1" in
  -b | --bucket)
    bucket="$1=$2"
    shift 2
    ;;
  -g | --results-glob)
    [ "$2" != "" ] && glob="$1=$2"
    shift 2
    ;;
  -p | --prefix)
    [ "$2" != "" ] && prefix="$1=$2"
    shift 2
    ;;
  -r | --base-url)
    [ "$2" != "" ] && base_url="$1=$2"
    shift 2
    ;;
  -u | --update-pr)
    [ "$2" != "" ] && updatePr="$1=$2"
    shift 2
    ;;
  -t | --config)
    [ "$2" != "" ] && config="$1=$2"
    shift 2
    ;;
  -s | --add-summary)
    [ "$2" == "true" -o "$2" == "1" ] && add_summary="$1"
    shift 2
    ;;
  -m | --collapse-summary)
    [ "$2" == "true" -o "$2" == "1" ] && collapse_summary="$1"
    shift 2
    ;;
  -r | --ci-report-title)
    [ "$2" == "true" -o "$2" == "1" ] && ci_report_title="$1"
    shift 2
    ;;
  -l | --copy-latest)
    [ "$2" == "true" -o "$2" == "1" ] && copy_latest="$1"
    shift 2
    ;;
  -i | --ignore-missing-results)
    [ "$2" == "true" -o "$2" == "1" ] && ignore_missing="$1"
    shift 2
    ;;
  -f | --flaky-warning-status)
    [ "$2" == "true" -o "$2" == "1" ] && flaky_warning_title="$1"
    shift 2
    ;;
  -c | --color)
    [ "$2" == "true" -o "$2" == "1" ] && color="$1"
    shift 2
    ;;
  -d | --debug)
    [ "$2" == "true" -o "$2" == "1" ] && debug="$1"
    shift 2
    ;;
  -q | --parallel)
    [ "$2" == "true" -o "$2" == "1" ] && parallel="$1"
    shift 2
    ;;
  -n | --report-name)
    [ "$2" == "true" -o "$2" == "1" ] && report_name="$1"
    shift 2
    ;;
  # -- means the end of the arguments; drop this, and break out of the while loop
  --)
    shift
    break
    ;;
  *)
    echo "Unexpected option provided: '$1'"
    exit 2
    ;;
  esac
done

args="upload $@ ${glob} ${bucket} ${prefix} ${base_url} ${updatePr} ${config} ${add_summary} ${collapse_summary} ${ci_report_title} ${copy_latest} ${ignore_missing} ${flaky_warning_title} ${color} ${debug} ${parallel} ${report_name}"
trimmed_args=$(echo ${args} | awk '{$1=$1};1')

echo "Running allure-report-publisher with arguments: '${trimmed_args}'"

eval "allure-report-publisher ${trimmed_args}"
