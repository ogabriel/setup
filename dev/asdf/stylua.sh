#!/usr/bin/env bash

if [ -f "/etc/arch-release" ]; then
    sudo pacman -S --noconfirm --needed curl unzip bash
elif [ -f "/etc/lsb-release" ]; then
    sudo apt install -y curl unzip bash
fi

asdf plugin add stylua
asdf plugin update stylua
asdf install stylua latest
asdf global stylua latest
