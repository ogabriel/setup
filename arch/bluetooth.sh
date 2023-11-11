#!/usr/bin/env sh

sudo pacman -S --needed \
    bluez \
    bluez-utils \
    bluez-libs \
    blueman \
    libappindicator-gtk3

modprobe btusb

sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
