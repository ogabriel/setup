#!/usr/bin/env bash

if [ -f "/etc/arch-release" ]; then
    sudo pacman -S base-devel linux-headers
elif [ -f "/etc/lsb-release" ]; then
    sudo apt-get install linux-headers-$(uname -r) build-essential
fi

asdf plugin add lua
asdf plugin update lua
asdf install lua latest
