FROM andrcuns/allure-report-publisher:1.5.0

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
