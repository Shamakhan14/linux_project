#!/bin/bash

#command: sh iptables_setup.sh

#разрешает все запросы по цепочке input интерфейса lo
iptables -A INPUT -i lo -j ACCEPT
#запрет ping
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP
#разрешение протокола icmp
iptables -A INPUT -p icmp -j ACCEPT
#разрешение всех соединений созданных сервером в сторону интернета
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
#запрет инвалидных пакетов
iptables -A INPUT -m state --state INVALID -j DROP
#разрешение трафика на порт 22
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
#разрешение трафика на порт 80
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
#разрешение трафика на порт 443
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
#разрешение трафика на порт 443
iptables -A INPUT -p udp --dport 443 -j ACCEPT
#разрешение трафика на порт 8443
iptables -A INPUT -p tcp --dport 8443 -j ACCEPT
#завершение настройки таблицы. установка правила по умолчанию на запрет
iptables -P INPUT DROP
#сохранение настроек
iptables-save
netfilter-persistent save
netfilter-persistent start
