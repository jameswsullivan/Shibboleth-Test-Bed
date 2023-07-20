#!/bin/bash

# Generate signing keys
shib-keygen
mv /etc/shibboleth/sp-cert.pem /etc/shibboleth/sp-signing-cert.pem
mv /etc/shibboleth/sp-key.pem /etc/shibboleth/sp-signing-key.pem

# Generate encrypt keys
shib-keygen
mv /etc/shibboleth/sp-cert.pem /etc/shibboleth/sp-encrypt-cert.pem
mv /etc/shibboleth/sp-key.pem /etc/shibboleth/sp-encrypt-key.pem

service apache2 start
service shibd start

exec "$@"
tail -f /dev/null