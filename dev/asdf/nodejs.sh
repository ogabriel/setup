#!/usr/bin/env bash

if which apt; then
    sudo apt install -y python3 g++ make python3-pip
elif which pacman; then
    sudo pacman -S --noconfirm --needed python gcc make python-pip
fi

asdf plugin add nodejs
asdf plugin update nodejs

VERSION=${1:-$(asdf latest nodejs)}

asdf install nodejs $VERSION
asdf global nodejs $VERSION
