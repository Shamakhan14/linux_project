#!/bin/bash

#command: sh network_setup.sh {apache1_ip} {apache2_ip}

APACHE1_IP=$1
OLD_APACHE1_IP="old_apache1_ip"
APACHE2_IP=$2
OLD_APACHE2_IP="old_apache2_ip"
NGINX_CONF_NAME="sites-available/default"

sed -i "s/$OLD_APACHE1_IP/$APACHE1_IP/g" "$NGINX_CONF_NAME"
sed -i "s/$OLD_APACHE2_IP/$APACHE2_IP/g" "$NGINX_CONF_NAME"

cp -r nginx_config/* /etc/nginx/
cp -r icons/* /usr/share/apache2/icons/
cp -r html/* /var/www/html

service nginx reload
service nginx restart