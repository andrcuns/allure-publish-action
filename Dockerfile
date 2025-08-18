FROM andrcuns/allure-report-publisher:4.7.2

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
