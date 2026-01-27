FROM andrcuns/allure-report-publisher:5.0.2

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
