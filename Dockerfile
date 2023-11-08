FROM andrcuns/allure-report-publisher:2.0.0

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
