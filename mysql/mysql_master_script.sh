#!/bin/bash

#command: sh mysql_master_script.sh

rm /etc/mysql/mysql.conf.d/*
cp ./master/* /etc/mysql/mysql.conf.d

service mysql restart

mysql -u root << EOF
CREATE USER repl@'%' IDENTIFIED WITH 'caching_sha2_password' BY 'oTUSlave#2020';
GRANT REPLICATION SLAVE ON *.* TO repl@'%';
CREATE DATABASE otus;
EOF