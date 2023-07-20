FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y nano tzdata locales && \
    ln -fs /usr/share/zoneinfo/US/Central /etc/localtime && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 && \
    apt-get install -y apache2 libapache2-mod-shib && \
    mkdir /opt/shibboleth

COPY ./shibboleth2.xml.test /etc/shibboleth/shibboleth2.xml
COPY ./ubuntu.entrypoint.sh /opt/shibboleth/entrypoint.sh

RUN chmod +x /opt/shibboleth/entrypoint.sh

WORKDIR /etc/shibboleth

EXPOSE 80 443
ENTRYPOINT [ "/opt/shibboleth/entrypoint.sh" ]