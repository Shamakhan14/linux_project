#!/bin/bash

#command: sh mysql_slave_script.sh {apache1_ip}
#apache1_ip: 192.168.31.73

APACHE1_IP=$1

rm /etc/mysql/mysql.conf.d/*
cp ./slave/* /etc/mysql/mysql.conf.d

service mysql restart

mysql -u root << EOF
stop slave;
stop replica;
CHANGE REPLICATION SOURCE TO SOURCE_HOST='$APACHE1_IP', SOURCE_USER='repl', SOURCE_PASSWORD='oTUSlave#2020', SOURCE_AUTO_POSITION = 1, GET_SOURCE_PUBLIC_KEY = 1;
start replica;
show replica status\G
EOF