#!/bin/bash
export ANSIBLE_HOST_KEY_CHECKING=False
echo enter username
read usr
echo enter password
read -s pass
echo enter device Ip Address
read ip
curl -s -k -u $usr:$pass "https://172.17.1.205/webacs/api/v4/data/Clients.json?.full=true&deviceIpAddress=$ip" | python -m json.tool | grep -P '(?<=clientInterface":).*$' -o
ansible-playbook ports.yml -i "$ip,"