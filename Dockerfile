FROM ghcr.io/andrcuns/allure-report-publisher:5.2.0

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
