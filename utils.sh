#!/bin/bash
# utils, programs that you may use for something

cd

echo 'Updating and upgrading'
sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install dialog
cmd=(dialog --separate-output --checklist "Please select software you want to install: " 22 76 16)
options=(
        1 "spotity" off
        2 "tmux" off
        3 "chromium" off
        4 "google chrome" off
        5 "vlc" off)
        choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
        clear

for choice in $choices
do
    case $choice in
        1)
            wget -O- https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
            sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free"
            sudo apt-get update
            sudo apt-get install spotify-client -y --allow-unauthenticated
            ;;
        2)
            sudo apt-get install tmux -y
            ;;
        3)
            sudo apt-get install chromium-browser -y
            ;;
        4)
            wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O chrome.deb
            sudo dpkg -i chrome.deb
            sudo apt-get install -f
            ;;
        5)
            sudo add-apt-repository ppa:videolan/stable-daily
            sudo apt-get update
            sudo apt-get install vlc
        ;;
    esac
done
