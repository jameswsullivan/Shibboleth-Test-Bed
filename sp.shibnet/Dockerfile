FROM unicon/shibboleth-sp

RUN yum-config-manager --save --setopt=security_shibboleth.skip_if_unavailable=true && \
    yum update -y && \
    yum install sudo -y && \
    yum install nano -y && \
    yum install openldap-clients -y

# Copy the Shibboleth configuration files to the container
COPY example.shibboleth2.xml /etc/shibboleth/shibboleth2.xml

EXPOSE 80 443