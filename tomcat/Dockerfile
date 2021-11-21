FROM tomcat:7.0-jdk8-adoptopenjdk-hotspot
LABEL maintainer="xili@zuora.com"

COPY conf/server.xml /usr/local/tomcat/conf
COPY jrebel6/jrebel.jar /jrebel.jar
COPY jrebel6/libjrebel64.so /lib/libjrebel64.so


ENV JAVA_OPTS="-Xmx8192m -Xms1024m -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=9010 -Dcom.sun.management.jmxremote.rmi.port=9010 -Djava.rmi.server.hostname=0.0.0.0 -Dcom.sun.management.jmxremote.ssl=false -Dorg.apache.tomcat.util.buf.UDecoder.ALLOW_ENCODED_SLASH=true -XX:+UseG1GC -agentpath:/lib/libjrebel64.so -Drebel.remoting_plugin=true -Drebel.log.file=/jrebel.log"
ENV JPDA_ADDRESS=8000
ENV JPDA_TRANSPORT=dt_socket

RUN apt-get update
RUN apt-get install netcat -y
RUN apt-get install vim -y
EXPOSE 8080
EXPOSE 8081
EXPOSE 8000
EXPOSE 9010
CMD ["catalina.sh", "jpda", "run"]
