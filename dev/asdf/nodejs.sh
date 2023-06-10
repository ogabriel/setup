#!/usr/bin/env bash

if which apt; then
    sudo apt-get install python3 g++ make python3-pip -y
elif which pacman; then
    sudo pacman -S python gcc make python-pip --noconfirm
fi

asdf plugin add nodejs

asdf plugin update nodejs

asdf install nodejs latest
