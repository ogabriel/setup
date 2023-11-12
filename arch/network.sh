#!/usr/bin/env sh

echo "Installing network packages"
sudo pacman -S --needed \
    networkmanager \
    network-manager-applet \
    libappindicator-gtk3

echo "Enabling network service"
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service
