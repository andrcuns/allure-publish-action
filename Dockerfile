FROM andrcuns/allure-report-publisher:4.7.5

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
