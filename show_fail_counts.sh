#!/bin/sh
# Show all failcounts

primary="node1"
secondary="node2"

for resource in pingnet-clone drbdlinks mount_srv apache2 virt-ip pingnet drbd_r0 mysql fs-ip
do
    echo "\033[38;6;33m$resource on $primary:\033[39m": `crm resource failcount $resource show $primary | cut -d"=" -f 4`
    echo "\033[38;5;31m$resource on $secondary:\033[39m": `crm resource failcount $resource show $secondary | cut -d"=" -f 4`
done
