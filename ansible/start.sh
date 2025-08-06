#!/bin/bash
set_inventory.sh
ansible-playbook playbook/set_config.yml
echo "remote_port = 1871" >> ansible.cfg
ansible-playbook playbook/install_ca.yaml