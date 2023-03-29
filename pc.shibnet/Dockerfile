FROM dorowu/ubuntu-desktop-lxde-vnc:latest

RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install iputils-ping -y && \
    apt-get install iproute2 -y && \
    apt-get install traceroute -y && \
    apt-get install sudo -y && \
    apt-get install nano -y && \
    apt-get install slapd ldap-utils -y

EXPOSE 5900