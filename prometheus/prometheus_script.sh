#!/bin/bash

#command: sh network_setup.sh {apache1_ip} {apache2_ip}
#apache1_ip: 192.168.31.73
#apache2_ip: 192.168.31.20

APACHE1_IP=$1
APACHE2_IP=$2

cat << EOF >> /etc/prometheus/prometheus.yml
  - job_name: 'apache1'
    static_configs:
      - targets: ['$APACHE1_IP:9117']

  - job_name: 'apache1'
    static_configs:
      - targets: ['$APACHE2_IP:9117']

EOF