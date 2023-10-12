#!/usr/bin/env bash

if [ -f "/etc/arch-release" ]; then
    sudo pacman -S --noconfirm --needed base-devel linux-headers
elif [ -f "/etc/lsb-release" ]; then
    sudo apt install -y linux-headers-$(uname -r) build-essential
fi

asdf plugin add lua
asdf plugin update lua
asdf install lua latest
asdf global lua latest
