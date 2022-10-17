#!/bin/sh

PARSED_ARGUMENTS=$(
  getopt \
    -o g:b:p:u:s:t:m:l:i:c:d: \
    --long results-glob:,bucket:,prefix:,update-pr:,summary:,summary-table-type:,collapse-summary:,copy-latest:,ignore-missing-results:,color:,debug: \
    -- "$@"
)

eval set -- "$PARSED_ARGUMENTS"
while :; do
  case "$1" in
  -g | --results-glob)
    glob="$1='$2'"
    shift 2
    ;;
  -b | --bucket)
    bucket="$1=$2"
    shift 2
    ;;
  -p | --prefix)
    [ "$2" != "" ] && prefix="$1=$2"
    shift 2
    ;;
  -u | --update-pr)
    [ "$2" != "" ] && updatePr="$1=$2"
    shift 2
    ;;
  -s | --summary)
    [ "$2" != "" ] && summary="$1=$2"
    shift 2
    ;;
  -t | --summary-table-type)
    [ "$2" != "" ] && table_type="$1=$2"
    shift 2
    ;;
  -m | --collapse-summary)
    [ "$2" == "true" -o "$2" == "1" ] && collapse_summary="$1"
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
  -c | --color)
    [ "$2" == "true" -o "$2" == "1" ] && color="$1"
    shift 2
    ;;
  -d | --debug)
    [ "$2" == "true" -o "$2" == "1" ] && debug="$1"
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

args="upload $@ ${glob} ${bucket} ${prefix} ${updatePr} ${summary} ${table_type} ${collapse_summary} ${copy_latest} ${ignore_missing} ${color} ${debug}"
trimmed_args=$(echo ${args} | awk '{$1=$1};1')

echo "Running allure-report-publisher with arguments: '${trimmed_args}'"

eval "allure-report-publisher ${trimmed_args}"
