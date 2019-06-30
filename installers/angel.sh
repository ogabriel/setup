#!/bin/bash

sudo apt update && sudo apt upgrade

sudo apt install linux-headers-$(uname -r)

sudo apt install neofetch -y

sudo apt install git -y

sudo apt install xserver-xorg-video-dummy xserver-xorg-input-void xinit x11-xserver-utils -y

sudo apt install xserver-xorg-video-nouveau -y

sudo apt install xserver-xorg-input-mouse xserver-xorg-input-kbd xserver-xorg-inputs-synaptics -y

sudo apt install xfonts-utils xfonts-100dpi xfonts-75dpi xfonts-base xfonts-scalable -y

sudo apt install xserver-xorg-hwe-18.04 xserver-xorg-input-all-hwe-18.04 -y

sudo apt install libgl1-mesa-dri mesa-utils -y

sudo apt install lightdm lightdm-greeter lightdm-webkit-greeter --no-install-recommends -y

sudo apt install i3 --no-install-recommends -y

sudo apt install compton -y

sudo apt install vim neovim vim-gnome -y

sudo apt install chromium-browser -y

sudo apt install build-essential -y

sudo apt install pulseaudio feh imagemagick ranger chromium-browser

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# Create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in
# your PATH)
ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications
# Update the path to the kitty icon in the kitty.desktop file
sed -i "s/Icon\=kitty/Icon\=\/home\/$USER\/.local\/kitty.app\/share\/icons\/hicolor\/256x256\/apps\/kitty.png/g" ~/.local/share/applications/kitty.desktop
