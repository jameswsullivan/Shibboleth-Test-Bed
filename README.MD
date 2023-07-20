# Shibboleth Test Bed

This project is attempting to establish a lab environment to test the deployment of Shibboleth Identity Provider and Shibboleth Service Provider with WordPress and an LDAP server. The goal is to log in to WordPress via SSO using credentials provided by the LDAP server.

## Components

- Test OpenLDAP server:
    - https://github.com/rroemhild/docker-test-openldap
    - https://hub.docker.com/r/rroemhild/test-openldap
- Docker Ubuntu VNC Desktop:
    - https://github.com/fcwu/docker-ubuntu-vnc-desktop
    - https://hub.docker.com/r/dorowu/ubuntu-desktop-lxde-vnc
- Ubuntu/MySQL: https://hub.docker.com/r/ubuntu/mysql
- WordPress running on LAMP stack on Ubuntu.
- Shibboleth Service Provider V3.4.1
- Shibboleth Identity Provider V4.3.0

## Start/stop the services

```
docker compose up -d

docker compose down or docker compose down -v
```

## Run tests

#### Test LDAP server
From the `linux-pc`, run the following commands:
```
ldapsearch -H ldap://ldap-server:10389 -x -b "ou=people,dc=planetexpress,dc=com" -D "cn=admin,dc=planetexpress,dc=com" -w GoodNewsEveryone "(objectClass=inetOrgPerson)"

ldapsearch -x -b "dc=planetexpress,dc=com" -H ldap://ldap-server:10389 -D "cn=admin,dc=planetexpress,dc=com" -w GoodNewsEveryone "(cn=Hubert J. Farnsworth)" cn description displayName EnployeeType mail ou uid
```

#### Test Shibboleth SP

- In the `shibboleth-sp` container, run:
    - `shibd -t``, your should get `overall configuration is loadable, check console for non-fatal problems`.
    - `apache2ctl configtest`, you should get `Syntax OK`.
- From the `linux-pc` container, open Firefox:
    - `http://shibboleth-sp/`, should show you the default apache landing page.
    - `http://shibboleth-sp/Shibboleth.sso/Session`, you should see a message `A valid session was not found.`.
    - `http://shibboleth-sp/Shibboleth.sso/Status`, you should see Shibboleth's default XML page.

#### WordPress initialization
From the `linux-pc`, visit `http://wordpress-web/` and perform the usual WordPress setup using the following database info:
- Database host: `wordpress-mysql`
- Database name: `wp`
- Database user: `wordpress`
- Database password: `1234`