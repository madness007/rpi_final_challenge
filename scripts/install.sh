#!/usr/bin/env bash

function pause() {
   read -p "$* [ENTER TO CONTINUE]"
}

pause "Ready to start installing the linux final exercise?"

# Just add the commands below to start installing tools, dependencies, ...
sudo apt update
sudo apt upgrade
sudo apt install git -y
sudo apt install curl -y
sudo apt install zsh -y
sudo apt install ufw -y
sudo apt install apache2 -y
sudo apt install libffi-dev -y
sudo apt install libssl-dev -y
sudo apt install python3-dev -y
sudo apt install python3 -y
sudo apt install python3-pip -y
sudo apt install -y mosquitto mosquitto-clients

sudo systemctl enable mosquitto.service

# The end
pause "All done - rebooting now"
reboot -h now
