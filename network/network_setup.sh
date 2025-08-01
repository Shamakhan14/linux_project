#!/bin/bash

#command: sh network_setup.sh {vm_ip} {vm_route}

IP=$1
OLD_IP="old_ip"
ROUTE=$2
OLD_ROUTE="old_route"
FILENAME="50-cloud-init.yaml"

sed -i "s/$OLD_IP/$IP/g" "$FILENAME"
sed -i "s/$OLD_ROUTE/$ROUTE/g" "$FILENAME"