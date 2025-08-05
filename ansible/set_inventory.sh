#!/bin/bash
echo "harbor-server ansible_host=$(cat ../vm-create-terraform/harbor_server_ip.txt) ansible_user=root ansible_connection=ssh" > inventory.yml
echo "ca-server ansible_host=$(cat ../vm-create-terraform/ca_server_ip.txt) ansible_user=root ansible_connection=ssh" >> inventory.yml
