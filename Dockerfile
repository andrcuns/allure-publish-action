FROM andrcuns/allure-report-publisher:4.7.3

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
