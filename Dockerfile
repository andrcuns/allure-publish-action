FROM andrcuns/allure-report-publisher:1.7.0

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
