#!/bin/bash

sudo apt update && sudo apt upgrade

sudo apt install linux-headers-$(uname -r) &&

sudo apt install neofetch -y &&

sudo apt install git -y &&

sudo apt install xserver-xorg-video-dummy xserver-xorg-input-void xinit x11-xserver-utils -y &&

sudo apt install xserver-xorg-video-nouveau -y &&

sudo apt install xserver-xorg-input-mouse xserver-xorg-input-kbd xserver-xorg-inputs-synaptics -y &&

sudo apt install xfonts-utils xfonts-100dpi xfonts-75dpi xfonts-base xfonts-scalable -y &&

sudo apt install xserver-xorg-hwe-18.04 xserver-xorg-input-all-hwe-18.04 -y &&

sudo apt install libgl1-mesa-dri mesa-utils -y &&

sudo apt install lightdm lightdm-greeter lightdm-webkit-greeter --no-install-recommends -y &&

sudo apt install i3 --no-install-recommends -y &&

sudo apt install compton -y &&

sudo apt install vim neovim vim-gnome -y &&

sudo apt install chromium-browser -y &&

sudo apt install build-essential -y &&

sudo apt install pulseaudio feh imagemagick ranger chromium-browser -y &&


