FROM andrcuns/allure-report-publisher:1.6.1

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
