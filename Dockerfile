FROM andrcuns/allure-report-publisher:1.4.2

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
