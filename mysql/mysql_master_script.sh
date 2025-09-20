#!/bin/bash

#command: sh network_setup.sh {apache1_ip} {apache2_ip}
#apache1_ip: 192.168.31.73
#apache2_ip: 192.168.31.20

rm /etc/mysql/mysql.conf.d/*
cp ./master/* /etc/mysql/mysql.conf.d

service mysql restart

mysql
CREATE USER repl@'%' IDENTIFIED WITH 'caching_sha2_password' BY 'oTUSlave#2020';
GRANT REPLICATION SLAVE ON *.* TO repl@'%';