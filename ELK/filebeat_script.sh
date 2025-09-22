#!/bin/bash

#command: sh logstash_script.sh

cp filebeat/filebeat.yml /etc/filebeat/filebeat.yml

systemctl restart filebeat