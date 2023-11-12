#!/usr/bin/env sh

echo "Installing gnome packages"
sudo pacman -S --needed \
    gnome-calculator \
    gnome-keyring \
    polkit-gnome
