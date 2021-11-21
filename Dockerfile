FROM billing-tomcat-dev_tomcat:latest
LABEL maintainer="xili@zuora.com"

COPY ./target/billing.servers.frontend.web-290.0.0-SNAPSHOT /usr/local/tomcat/webapps/apps

