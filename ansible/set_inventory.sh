#!/bin/bash
echo "harbor-server ansible_host=$(cat ../vm-create-terraform/server_ip/harbor_server_ip.txt) ansible_user=root ansible_connection=ssh" > inventory.yml
echo "ca-server ansible_host=$(cat ../vm-create-terraform/server_ip/ca_server_ip.txt) ansible_user=root ansible_connection=ssh" >> inventory.yml
