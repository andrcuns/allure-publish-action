FROM andrcuns/allure-report-publisher:4.5.0

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
