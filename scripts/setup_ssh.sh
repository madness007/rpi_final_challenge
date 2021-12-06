#!/usr/bin/env bash

echo "Enter username to give acces with ssh keys: "
read username
echo "enter the public key or leave empty to fetch from github: "
read key

if [ -z "$key" ]
then
	echo "enter the github username to fetch the keys from"
	read githubname
	echo "Getting gitkeys for: $githubname"
	key=$(curl -s https://github.com/${githubname}.keys)
fi

sudo install -d -m 700 /home/$username/.ssh

echo "$key" > /home/$username/.ssh/authorized_keys
sudo chmod 644 /home/$username/.ssh/authorized_keys
sudo chown $username:$username /home/$username/.ssh/authorized_keys
echo "this is the result in the keys file: "
echo $(cat /home/$username/.ssh/authorized_keys)
