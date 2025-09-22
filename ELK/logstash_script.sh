#!/bin/bash

#command: sh logstash_script.sh

mkdir /etc/logstash/certs/
cp /etc/elasticsearch/certs/http_ca.crt /etc/logstash/certs/
chown -R logstash:logstash /etc/logstash/certs/

echo "path.config: /etc/logstash/conf.d" >> /etc/logstash/logstash.yml

cat << EOF > /etc/logstash/conf.d/logstash-nginx-es.conf
input {
    beats {
        port => 5400
    }
}

filter {
 grok {
   match => [ "message" , "%{COMBINEDAPACHELOG}+%{GREEDYDATA:extra_fields}"]
   overwrite => [ "message" ]
 }
 mutate {
   convert => ["response", "integer"]
   convert => ["bytes", "integer"]
   convert => ["responsetime", "float"]
 }
 date {
   match => [ "timestamp" , "dd/MMM/YYYY:HH:mm:ss Z" ]
   remove_field => [ "timestamp" ]
 }
}

output {
 elasticsearch {
   hosts => ["https://localhost:9200"]
   user => "elastic"
   password => "123456"
   index => "weblogs-%{+YYYY.MM.dd}"
   document_type => "nginx_logs"
   cacert => "/etc/logstash/certs/http_ca.crt"
 }
 stdout { codec => rubydebug }
}
EOF

systemctl restart logstash.service