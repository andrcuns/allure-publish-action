FROM andrcuns/allure-report-publisher:0.9.0

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
