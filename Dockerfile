FROM tomcat:7-jdk8-adoptopenjdk-hotspot

COPY jrebel6 /usr/local/tomcat/jrebel6

ENV CATALINA_OPTS="-agentpath:/usr/local/tomcat/jrebel6/lib/libjrebel64.so -Drebel.remoting_plugin=true -Dorg.apache.tomcat.util.buf.UDecoder.ALLOW_ENCODED_SLASH=true"
ENV JPDA_ADDRESS="8082"

CMD ["catalina.sh", "jpda", "run"]