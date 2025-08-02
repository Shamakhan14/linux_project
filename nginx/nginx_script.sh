#!/bin/bash

#command: sh network_setup.sh {apache1_ip} {apache2_ip} {icon_folder_path}
#apache1_ip: 192.168.31.73
#apache2_ip: 192.168.31.20
#icon_folder_path: /home/tester/git/linux_project/nginx

APACHE1_IP=$1
OLD_APACHE1_IP="old_apache1_ip"
APACHE2_IP=$2
OLD_APACHE2_IP="old_apache2_ip"
ICON_PATH=$3
OLD_ICON_PATH="old_icon_folder_path"
NGINX_CONF_NAME="nginx_config/sites-available/default"

sed -i "s/$OLD_APACHE1_IP/$APACHE1_IP/g" "$NGINX_CONF_NAME"
sed -i "s/$OLD_APACHE2_IP/$APACHE2_IP/g" "$NGINX_CONF_NAME"
sed -i "s/$OLD_ICON_PATH/$ICON_PATH/g" "$NGINX_CONF_NAME"

cp -r nginx_config/* /etc/nginx/
cp -r html/* /var/www/html

service nginx reload
service nginx restart
