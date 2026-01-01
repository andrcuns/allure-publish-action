FROM andrcuns/allure-report-publisher:4.7.6

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
