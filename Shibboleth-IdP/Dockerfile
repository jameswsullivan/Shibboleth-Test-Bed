FROM ubuntu

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin
ENV JAVA_OPTS=-Djava.security.egd=file:///dev/urandom
ENV CATALINA_BASE=/usr/local/tomcat
ENV CATALINA_HOME=/usr/local/tomcat
ENV CATALINA_TMPDIR=/usr/local/tomcat/temp
ENV CATALINA_OPTS="-Xms512M -Xmx1024M -server -XX:+UseParallelGC"

RUN mkdir /opt/shib_install/ && \
    mkdir /opt/custom_config/ && \
    mkdir /usr/local/tomcat && \
    apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install sudo -y && \
    apt-get install nano -y && \
    apt install iproute2 -y && \
    apt-get install iputils-ping -y && \
    apt-get install iproute2 -y && \
    apt-get install traceroute -y && \
    apt-get install ldap-utils -y && \
    apt-get install default-jdk -y && \
    echo "PATH=\"$PATH\"" > /etc/environment

COPY shibboleth-identity-provider-4.3.0/ /opt/shib_install/
COPY apache-tomcat-9.0.73/ /usr/local/tomcat/
COPY jstl-1.2.jar /usr/local/tomcat/lib/jstl-1.2.jar
COPY access-control.xml /opt/custom_config/access-control.xml
COPY config.sh /opt/custom_config/config.sh
COPY restart.sh /opt/custom_config/restart.sh

EXPOSE 8080