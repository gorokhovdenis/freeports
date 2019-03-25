#!/bin/bash
export ANSIBLE_HOST_KEY_CHECKING=False
<<<<<<< HEAD
#echo enter username
#read usr
#echo enter password
#read -s pass
echo enter device Ip Address
read ip
#curl -s -k -u $usr:$pass "https://172.17.1.205/webacs/api/v4/data/Clients.json?.full=true&deviceIpAddress=$ip" | python -m json.tool | grep -P '(?<=clientInterface":).*$' -o
curl -s -k -u apiuser:Cisco6o66o6 "https://172.17.1.205/webacs/api/v4/data/Clients.json?.full=true&deviceIpAddress=$ip&associationTime=gt(1529278666381)" | python -m json.tool | grep -P '(?<=clientInterface":).*$' -o | tee reserved
ansible-playbook ports.yml -i "$ip," --vault-password-file=./.vault_pass | tee free
python3.6 code.py
=======
echo enter username
read usr
echo enter password
read -s pass
echo enter device Ip Address
read ip
curl -s -k -u $usr:$pass "https://172.17.1.205/webacs/api/v4/data/Clients.json?.full=true&deviceIpAddress=$ip&associationTime=gt(1529278666381)" | python -m json.tool | grep -P '(?<=clientInterface":).*$' -o
ansible-playbook ports.yml -i "$ip," --vault-password-file=./.vault_pass
>>>>>>> 2a8986e62929f321f94464694eebb0e6b0656e30
read -r -p "reserve ports? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
        bash reserveport.sh
else
	:
fi