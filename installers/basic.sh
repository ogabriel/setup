#!/bin/bash
sudo apt-get install linux-headers-$(uname -r)

apt install \
    xorg \
    neofetch ranger chromium \
    pulseaudio blueman \
    feh build-essential lm-sensors

apt install intel-microcode

# apt install network-manager-gnome

apt install i3 --no-install-recommends
apt install compton # compton-conf

apt install lightdm

apt install snapd

apt install sudo

adduser gabriel sudo


