FROM andrcuns/allure-report-publisher:3.0.1

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
