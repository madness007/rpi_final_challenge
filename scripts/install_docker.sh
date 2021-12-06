#!/usr/bin/env bash

function pause() {
   read -p "$* [ENTER TO CONTINUE]"
}

pause "Ready to start installing docker?"

# Just add the commands below to start installing tools, dependencies, ...
curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
sudo sh /tmp/get-docker.sh
sudo pip3 install docker-compose
sudo systemctl enable docker

# The end
pause "Docker is installed. Rebooting now..."
reboot -h now
