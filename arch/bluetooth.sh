#!/usr/bin/env sh

echo "Installing bluetooth packages"
sudo pacman -S --needed \
    bluez \
    bluez-utils \
    bluez-libs \
    blueman \
    libappindicator-gtk3

modprobe btusb

echo "Enabling bluetooth service"
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
