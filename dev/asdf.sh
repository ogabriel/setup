#!/usr/bin/env bash

if which apt; then
    sudo apt install curl git -y
elif which pacman; then
    sudo pacman -S curl git --noconfirm
fi

git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"

CURRENT_SHELL=$(ps | grep `echo $$` | awk '{ print $4 }')

if [ $CURRENT_SHELL == "zsh" ]; then
    source ~/.zshrc
elif [ $CURRENT_SHELL == "bash" ]; then
    source ~/.bashrc
fi

asdf update
