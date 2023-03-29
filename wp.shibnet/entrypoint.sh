#!/bin/bash
service apache2 start || true

echo "nameserver 192.168.0.1" > /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf

tail -f /dev/null
