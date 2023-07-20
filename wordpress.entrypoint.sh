#!/bin/bash

service apache2 start

cd /etc/apache2/sites-available
a2ensite *
a2enmod rewrite

service apache2 restart
service apache2 reload

# vsftpdSettings="pasv_enable=YES\npasv_min_port=30000\npasv_max_port=30000\npasv_address=0.0.0.0\nwrite_enable=YES\nlocal_umask=022\n"

# echo -e ${vsftpdSettings} >> /etc/vsftpd.conf

# service vsftpd start

cd /

exec "$@"
tail -f /dev/null