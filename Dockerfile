FROM andrcuns/allure-report-publisher:1.4.1

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
