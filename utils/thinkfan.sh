#!/bin/bash

if which apt; then
    sudo apt install -y thinkfan
elif which pacman; then
    yay -S --noconfirm --needed thinkfan thinkfan-ui
fi
