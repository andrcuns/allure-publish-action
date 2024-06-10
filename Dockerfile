FROM andrcuns/allure-report-publisher:4.0.1

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
