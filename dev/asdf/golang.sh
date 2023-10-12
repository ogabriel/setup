#!/usr/bin/env bash

if [ -f "/etc/arch-release" ]; then
    sudo pacman -S --noconfirm --needed coreutils curl
elif [ -f "/etc/lsb-release" ]; then
    sudo apt install -y coreutils curl
fi

asdf plugin add golang
asdf plugin update golang

VERSION=${1:-$(asdf latest golang)}

asdf install golang $VERSION
asdf global golang $VERSION
