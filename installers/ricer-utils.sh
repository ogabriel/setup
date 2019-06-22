#!/bin/bash

echo "Updating and Upgrading all your current packages"
sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install dialog
cmd=(dialog --separate-output --checklist "Please Select Software you want to install:" 22 76 16)
options=(
		1 "st terminal" off
		2 "lightdm-mini-greeter" off
		3 "xbc-util-xrm" off
		4 "i3-gaps" off
		5 "mini-greeter" off
	)
	choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
	clear
	for choice in $choices
	do
	    case $choice in
		1)
			cd
			cd tmp

			git clone https://git.suckless.org/st
			cd st

			git checkout 0.8.2
			sudo make clean install
			;;
		2)
			apt-get install lightdm

			apt-get install build-essential automake \
				pkg-config fakeroot debhelper \
				liblightdm-gobject-dev libgtk-3-dev

			cd
			cd tmp
			git clone https://github.com/josephsurin/lightdm-mini-greeter
			cd lightdm-mini-greeter
			fakeroot dh binary
			sudo dpkg -i ../lightdm-mini-greeter_*.deb
			;;
		3)
			cd
			cd tmp
			git clone https://github.com/Airblader/xcb-util-xrm
			cd xcb-util-xrm
			git submodule update --init
			./autogen.sh --prefix=/usr
			make
			sudo make install
			;;
		4)
			cd
			cd tmp
			git clone https://www.github.com/Airblader/i3 i3-gaps
			cd i3-gaps
			# git checkout gaps && git pull
			autoreconf --force --install
			rm -rf build
			mkdir build
			cd build
			../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers

			make
			sudo make install
			;;
		5)
			cd
			cd tmp

			git clone git@github.com:josephsurin/lightdm-mini-greeter.git

			sudo apt-get install build-essential automake pkg-config fakeroot debhelper \
			    liblightdm-gobject-dev libgtk-3-dev
			cd lightdm-mini-greeter

			fakeroot dh binary
			sudo dpkg -i ../lightdm-mini-greeter_*.deb
			;;
	esac
done
