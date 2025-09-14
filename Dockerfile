FROM andrcuns/allure-report-publisher:4.7.4

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
