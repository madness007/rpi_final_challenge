#!/usr/bin/env bash

function pause() {
   read -p "$* [ENTER TO CONTINUE]"
}

echo "---Installation Guide for the final exercise---"
echo "Opties:"
opt1='Set_static_ip'
opt2='Set_hostname'
opt3='install_dependencies'
opt4='install_docker'
opt5='create_account'
opt6='create_group'
opt7='lock_account'
opt8='setup_ssh_authentication'
opt9='setup_default_shell'
opt10='connect_to_wireless_network'
opt11='setup_backup_with_cron'
opt12='install_dotfiles'


PS3='optie:: '
options=($opt1 $opt2 $opt3 $opt4 $opt5 $opt6 $opt7 $opt8 $opt9 $opt10 $opt11 $opt12 "Quit")
select opt in "${options[@]}"
do
    case $opt in
        $opt1)
            sudo nano /etc/dhcpcd.conf
            ;;
        $opt2)
            sudo raspi-config
            ;;
        $opt3)
            sudo ./install.sh
            ;;
        $opt4)
            sudo ./install_docker.sh
            ;;
        $opt5)
            echo "Enter username to add: "
            read username
            sudo adduser $username
            echo "Do you want to add the user to the docker and sudo group?"
            echo "press ENTER or CTRL+C to abort"
            read temp
            sudo adduser $username docker
            sudo adduser $username sudo
            ;;
        $opt6)
            echo "Enter groupname to add: "
            read groupname
            sudo addgroup $groupname
            echo "You can now add users with adduser <username> $groupname"
            ;;
        $opt7)
            echo "Enter username to lock the acocunt: "
            read username
            sudo usermod -L $username
            ;;
        $opt8)
            ./setup_ssh.sh
            ;;
        $opt9)
            ./default_shell.sh
            ;;
        $opt10)
            echo "add this:"
            echo ''
            echo 'country=BE'
            echo ''
            echo 'network={'
            echo '    ssid="YOURSSID"'
            echo '    psk="YOURPASSWORD"'
            echo '    scan_ssid=1'
            echo '}'
            echo ''
            read temp
            sudo nano /etc/wpa_supplicant/wpa_supplicant.conf
            echo "pls set country code"
            read temp
            sudo raspi-config
            sudo wpa_cli -i wlan0 reconfigure
            ;;
        $opt11)
            #doesnt work
            #crontab -l | { cat; echo "* * * * * ./backup.sh"; } | crontab -
            ;;
        $opt12)
            ../install
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
