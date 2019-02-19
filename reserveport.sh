echo enter ip
read s
ip="${s},"
echo enter username
read usr
echo enter password
read -s p
echo enter description
read DESC
pass="${p}"
while true
do
    echo enter interface
    read int
    #sho interface
    ansible all -m ios_command -a "username=$usr password=$pass  commands='show interface status | i $int'" -i $ip  -c local
    ansible all -m ios_command -a "username=$usr password=$pass  commands='show running-config interface $int'" -i $ip  -c local
    read -r -p "reserve this interface? [y/N] " response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
        #add description
        ansible all -m ios_config -a "username=$usr password=$pass parents='interface $int' lines='description $DESC'" -i $ip -c local
        #disable interface
        ansible all -m ios_config -a "username=$usr password=$pass parents='interface $int' lines='shutdown'" -i $ip -c local
        #show changes
        ansible all -m ios_command -a "username=$usr password=$pass  commands='show interface status | i $int'" -i $ip  -c local
        ansible all -m ios_command -a "username=$usr password=$pass  commands='show running-config interface $int'" -i $ip  -c local
    else
        break
    fi
    read -r -p "reserve more? [y/N] " response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
        :
    else
        break
    fi
done
read -r -p "save config? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    ansible all -m ios_command -a "username=$usr password=$pass commands='write memory'"  -i $ip -c local
else
    :
fi