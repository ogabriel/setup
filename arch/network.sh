#!/usr/bin/env sh

sudo pacman -S --needed \
    networkmanager \
    network-manager-applet \
    libappindicator-gtk3

sudo systemctl enable NetworkManager.service
