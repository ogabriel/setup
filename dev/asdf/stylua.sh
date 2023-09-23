#!/usr/bin/env bash

if [ -f "/etc/arch-release" ]; then
    sudo pacman -S curl unzip bash --noconfirm --needed
elif [ -f "/etc/lsb-release" ]; then
    sudo apt-get install curl unzip bash
fi

asdf plugin add stylua
asdf plugin update stylua
asdf install stylua latest
asdf global stylua latest
