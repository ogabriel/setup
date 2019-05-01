#!/bin/bash
cd

echo 'Updating and upgrading'
sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install -y dialog
cmd=(dialog --separate-output --checklist "Please select software you want to install: " 22 76 16)
options=(
	1 "basic" on
	2 "pywal" on
	2 "polybar" on
	)
	choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
	clear
for choice in $choices
do
case $choice in
    1)
	sudo apt-get install i3 xorg network-mananger-gnome neofetch \
	ranger thunar chromium pulseaudio blueman \
	rxvt-unicode sudo feh build-essentials lm-sensors
	;;
    2)
	sudo apt-get install python3 python3-pip
	sudo pip3 install pywal

	echo '(cat ~/.cache/wal/sequences &)' >> /home/$USER/.bashrc
	;;
    3)
	cdc
	sudo apt-get install build_essentials

	git clone https://github.com/jaagr/polybar.git
	cd polybar && ./build.sh
	;;
    esac
done

