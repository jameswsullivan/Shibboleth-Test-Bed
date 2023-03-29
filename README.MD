## About This Project

This project is designed to establish a fully functional lab environment to test the deployment of Shibboleth Identity Provider and Shibboleth Service Provider with WordPress and an LDAP server. The goal is to log in to WordPress via SSO using LDAP credentials.

#### Components

- Test OpenLDAP server from https://github.com/rroemhild/docker-test-openldap, https://hub.docker.com/r/rroemhild/test-openldap/
- Docker Ubuntu VNC Desktop from https://github.com/fcwu/docker-ubuntu-vnc-desktop, https://hub.docker.com/r/dorowu/ubuntu-desktop-lxde-vnc
- Ubuntu/MySQL: https://hub.docker.com/r/ubuntu/mysql
- WordPress running on Ubuntu.
- Shibboleth Service Provider V3.4.1
- Shibboleth Identity Provider V4.3.0

#### Docker Network

docker network create --subnet=192.168.0.0/24 --gateway=192.168.0.1 shibnet

#### List of containers and their IP assignment
- wp.shibnet - WordPress - 192.168.0.2
- db.shibnet - MySQL - 192.168.0.3
- sp.shibnet - Shibboleth Service Provider - 192.168.0.4
- idp.shibnet - Shibboleth Identity Provider - 192.168.0.5
- ldap.shibnet - LDAP server - 192.168.0.6
- pc.shibnet - Ubuntu desktop - 192.168.0.7

#### Build images from Dockerfile

docker image build --tag shib-wp:1.0 --progress plain --no-cache . 2>&1 | Tee-Object build.log

docker image build --tag shib-db:1.0 --progress plain --no-cache . 2>&1 | Tee-Object build.log

docker image build --tag shib-sp:1.0 --progress plain --no-cache . 2>&1 | Tee-Object build.log

docker image build --tag shib-idp:1.0 --progress plain --no-cache . 2>&1 | Tee-Object build.log

docker image build --tag shib-pc:base --progress plain --no-cache . 2>&1 | Tee-Object build.log


#### Start the containers
docker run -dit --name wp --network shibnet --ip 192.168.0.2 --hostname=wp.shibnet shib-wp:1.0

docker run -dit --name db --network shibnet --ip 192.168.0.3 --hostname=db.shibnet shib-db:1.0

docker run -dit --name sp --network shibnet --ip 192.168.0.4 --hostname=sp.shibnet shib-sp:1.0

docker run -dit --name idp --network shibnet --ip 192.168.0.5 --hostname=idp.shibnet shib-idp:1.0

docker run -dit --name ldap --network shibnet --ip 192.168.0.6 --hostname=ldap.shibnet rroemhild/test-openldap

docker run -d --name pc --network shibnet --ip 192.168.0.7 --hostname=pc.shibnet -p 5900:5900 shib-pc:base


#### Docker Compose Coming Soon

Place holder text.


#### Test LDAP Server

ldapsearch -H ldap://192.168.0.6:10389 -x -b "ou=people,dc=planetexpress,dc=com" -D "cn=admin,dc=planetexpress,dc=com" -w GoodNewsEveryone "(objectClass=inetOrgPerson)"

ldapsearch -x -b "dc=planetexpress,dc=com" -H ldap://192.168.0.6:10389 -D "cn=admin,dc=planetexpress,dc=com" -w GoodNewsEveryone "(cn=Hubert J. Farnsworth)" cn description displayName EnployeeType mail ou uid