FROM ubuntu:latest

# Setting non-interactive.
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

# Install packages.
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install sudo -y && \
    apt-get install nano -y && \
    apt-get install iputils-ping -y && \
    apt-get install iproute2 -y && \
    apt-get install traceroute -y && \
    apt-get install apache2 -y && \
    apt-get install php8.1 -y && \
    apt-get install php-mysql -y && \
    apt-get install libapache2-mod-php -y && \
    echo "LOG: Package Installation Completed"

# Copy files.
COPY wp/ /var/www/html/
COPY entrypoint.sh /opt/scripts/entrypoint.sh
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

# Verify service status and configure apache.
RUN echo "LOG: entrypoint.sh contains:" && \
    cat /opt/scripts/entrypoint.sh && \
    chown -R www-data:www-data /var/www/html && \
    echo "LOG: /var/www/html/ directory's ownership changed to www-data." && \
    ls -al /var/www/html

EXPOSE 80 443

ENTRYPOINT ["/opt/scripts/entrypoint.sh"]