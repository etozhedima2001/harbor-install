#!/bin/bash
set_inventory.sh
ansible-playbook playbooks/set_config.yml
echo "remote_port = 1871" >> ansible.cfg
ansible-playbook playbooks/install_ca.yaml