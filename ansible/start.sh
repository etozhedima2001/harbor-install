#!/bin/bash
echo "harbor-server ansible_host=$(cat ../vm-create-terraform/server_ip.txt) ansible_user=root ansible_connection=ssh" > inventory.yml
ansible-playbook playbooks/install_playbook.yml