FROM andrcuns/allure-report-publisher:4.1.0

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
