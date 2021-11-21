FROM hotswapagent/hotswap-vm
MAINTAINER xili@zuora.com

RUN apk add vim

ENV ARCHIVE apache-tomcat-7.0.107
ENV INSTALL_DIR /opt
ENV SERVER_HOME ${INSTALL_DIR}/${ARCHIVE}
RUN curl -o ${SERVER_HOME}.zip -L https://mirrors.bfsu.edu.cn/apache/tomcat/tomcat-7/v7.0.107/bin/apache-tomcat-7.0.107.zip
RUN unzip ${SERVER_HOME}.zip -d /opt
RUN chmod a+x ${SERVER_HOME}/bin/catalina.sh
ENV DEPLOYMENT_DIR ${SERVER_HOME}/webapps/

COPY conf/server.xml ${SERVER_HOME}/conf

ENV JAVA_OPTS="-Xmx4096m -Xms1024m -Dorg.apache.tomcat.util.buf.UDecoder.ALLOW_ENCODED_SLASH=true -XXaltjvm=dcevm -javaagent:/opt/hotswap-agent/hotswap-agent.jar -Dextra.class.path=/extra_class_path -XX:HotswapDeoptClassPath='com.zuora'"
ENV JPDA_ADDRESS=8000
ENV JPDA_TRANSPORT=dt_socket

EXPOSE 8080
EXPOSE 8081
EXPOSE 8000
ENTRYPOINT ${SERVER_HOME}/bin/catalina.sh jpda run
