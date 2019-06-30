#!/bin/bash

echo "Updating and Upgrading all your current packages"
sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install dialog
cmd=(dialog --separate-output --checklist "Please Select Software you want to install:" 22 76 16)
options=(
		1 "st terminal" off
		2 "st terminal alternative" off
		3 "lightdm-mini-greeter" off
		4 "lightdm-mini-greeter_alternative" off
		5 "i3-gaps" off
		6 "polybar" off
		7 "kitty" off
	)
	choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
	clear
	for choice in $choices
	do
	    case $choice in
		1)
			sudo apt install libx11-dev

			cd
			cd tmp

			git clone https://git.suckless.org/st
			cd st

			git checkout 0.8.2
			sudo make clean install
			;;
		2)
			sudo apt install libx11-dev

			cd
			cd tmp

			git clone https://github.com/japanoise/st
			cd st

			sudo make clean install
			;;
		3)
			sudo apt-get install build-essential automake \
				pkg-config fakeroot debhelper \
				liblightdm-gobject-1-dev libgtk-3-dev
			# sudo apt-get install build-essential automake \
			# 	pkg-config fakeroot debhelper \
			# 	liblightdm-gobject-dev libgtk-3-dev

			cd
			cd tmp

			git clone https://github.com/josephsurin/lightdm-mini-greeter
			cd lightdm-mini-greeter

			fakeroot dh binary
			sudo dpkg -i ../lightdm-mini-greeter_*.deb
			;;
		4)
			sudo apt-get install build-essential automake \
				pkg-config fakeroot debhelper \
				liblightdm-gobject-1-dev libgtk-3-dev
			# sudo apt-get install build-essential automake \
			# 	pkg-config fakeroot debhelper \
			# 	liblightdm-gobject-dev libgtk-3-dev

			cd
			cd tmp

			git clone https://github.com/josephsurin/lightdm-mini-greeter.git
			cd lightdm-mini-greeter

			fakeroot dh binary
			sudo dpkg -i ../lightdm-mini-greeter_*.deb
			;;
		5)
			sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
					libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
					libstartup-notification0-dev libxcb-randr0-dev \
					libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
					libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
					autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev

			cd
			cd tmp

			# clone the repository
			git clone https://www.github.com/Airblader/i3 i3-gaps
			cd i3-gaps

			# compile & install
			autoreconf --force --install
			rm -rf build/
			mkdir -p build && cd build/

			# Disabling sanitizers is important for release versions!
			# The prefix and sysconfdir are, obviously, dependent on the distribution.
			../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
			make
			sudo make install
			;;
		6)
			sudo apt install build-essential git cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev
			sudo apt install libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev

			cd
			cd tmp

			git clone --recursive https://github.com/polybar/polybar
			cd polybar

			mkdir build
			cd build
			cmake ..
			make -j$(nproc)
			# Optional. This will install the polybar executable in /usr/local/bin
			sudo make install
			;;
		7)
			curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

			# Create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in
			# your PATH)
			ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
			# Place the kitty.desktop file somewhere it can be found by the OS
			cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications
			# Update the path to the kitty icon in the kitty.desktop file
			sed -i "s/Icon\=kitty/Icon\=\/home\/$USER\/.local\/kitty.app\/share\/icons\/hicolor\/256x256\/apps\/kitty.png/g" ~/.local/share/applications/kitty.desktop
			;;
	esac
done
