#!/bin/bash

sudo apt install neofetch -y

sudo apt install git -y

sudo apt install xserver-xorg-video-dummy xserver-xorg-input-void xserver-xorg-core xinit x11-xserver-utils -y

sudo apt install xserver-xorg-video-nouveau -y

sudo apt install xserver-xorg-input-mouse xserver-xorg-input-kbd xserver-xorg-inputs-synaptics -y

sudo apt install xfonts-utils xfonts-100dpi xfonts-75dpi xfonts-base xfonts-scalable -y

sudo apt install libgl1-mesa-dri mesa-utils -y

sudo apt install lightdm --no-install-recommends -y

dm-tools --test-mode -d

sudo apt install lightdm-greeter lightdm-webkit-greeter -y

apt install i3 --no-install-recommends -y

apt install compton -y

apt install vim neovim vim-gnome -y

