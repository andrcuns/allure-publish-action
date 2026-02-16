FROM ghcr.io/andrcuns/allure-report-publisher:5.0.6

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
