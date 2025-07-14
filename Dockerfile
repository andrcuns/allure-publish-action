FROM andrcuns/allure-report-publisher:4.6.0

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
