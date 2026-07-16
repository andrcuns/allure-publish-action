FROM ghcr.io/andrcuns/allure-report-publisher:5.5.1

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
