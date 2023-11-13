#!/usr/bin/env sh

echo "Installing screen packages"
sudo pacman -S --needed \
    gammastep \
    brightnessctl \
    grim \
    slurp

yay -S flameshot-git
