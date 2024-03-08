FROM andrcuns/allure-report-publisher:3.2.0

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
