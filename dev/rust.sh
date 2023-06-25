#!/usr/bin/env bash

if which apt; then
    sudo apt install curl -y
elif which pacman; then
    sudo pacman -S curl --noconfirm
fi

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
