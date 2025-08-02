#!/bin/bash

#command: sh network_setup.sh {apache1_ip} {apache2_ip}
#apache1_ip: 192.168.31.73
#apache2_ip: 192.168.31.20

APACHE1_IP=$1
OLD_APACHE1_IP="old_apache1_ip"
APACHE2_IP=$2
OLD_APACHE2_IP="old_apache2_ip"
NGINX_CONF_NAME="nginx_config/sites-available/default"

sed -i "s/$OLD_APACHE1_IP/$APACHE1_IP/g" "$NGINX_CONF_NAME"
sed -i "s/$OLD_APACHE2_IP/$APACHE2_IP/g" "$NGINX_CONF_NAME"

cp -r nginx_config/* /etc/nginx
cp -r html/* /var/www/html
ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

service nginx reload
service nginx restart
