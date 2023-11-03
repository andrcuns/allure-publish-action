FROM andrcuns/allure-report-publisher:1.8.1

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
