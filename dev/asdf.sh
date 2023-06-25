#!/usr/bin/env bash

if which apt; then
    sudo apt install curl git -y
elif which pacman; then
    sudo pacman -S curl git --noconfirm
fi

git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"
