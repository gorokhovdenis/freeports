#!/bin/bash
export ANSIBLE_HOST_KEY_CHECKING=False
#echo enter username
#read usr
#echo enter password
#read -s pass
echo enter device Ip Address
read ip
#curl -s -k -u $usr:$pass "https://172.17.1.205/webacs/api/v4/data/Clients.json?.full=true&deviceIpAddress=$ip" | python -m json.tool | grep -P '(?<=clientInterface":).*$' -o
curl -s -k -u apiuser:Cisco6o66o6 "https://172.17.1.205/webacs/api/v4/data/Clients.json?.full=true&deviceIpAddress=$ip&associationTime=gt(8157096108)" | python -m json.tool | grep -P '(?<=clientInterface":).*$' -o
curl -s -k -u apiuser:Cisco6o66o6 "https://172.17.1.205/webacs/api/v4/data/Clients.json?.full=true&deviceIpAddress=$ip&associationTime=gt(8157096108)" | python -m json.tool | grep -P '(?<=clientInterface":).*$' -o > reserved
ansible-playbook ports.yml -i "$ip," --vault-password-file=./.vault_pass > free
python3.6 code.py
read -r -p "reserve ports? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
        bash reserveport.sh
else
	:
fi