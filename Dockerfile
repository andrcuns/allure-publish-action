FROM andrcuns/allure-report-publisher:0.8.0

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
