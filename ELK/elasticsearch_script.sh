#!/bin/bash

#command: sh ELK_script.sh {nginx_ip}
#nginx_ip: 192.168.31.73

NGINX_IP=$1
OLD_NGINX_IP="old_nginx_ip"
NGINX_CONF_NAME="elasticsearch/elasticsearch.yml"

sed -i "s/$OLD_NGINX_IP/$NGINX_IP/g" "$NGINX_CONF_NAME"

cp elasticsearch/jvm.options.d/* /etc/elasticsearch/jvm.options.d
rm /etc/elasticsearch/elasticsearch.yml
cp elasticsearch/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml

systemctl daemon-reload
systemctl enable --now elasticsearch.service