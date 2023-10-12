#!/usr/bin/env bash

if [ -f "/etc/arch-release" ]; then
    sudo pacman -S coreutils curl --noconfirm --needed
elif [ -f "/etc/lsb-release" ]; then
    sudo apt install coreutils curl
fi

asdf plugin add golang
asdf plugin update golang

VERSION=${1:-$(asdf latest golang)}

asdf install golang $VERSION
asdf global golang $VERSION
