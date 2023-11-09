#!/usr/bin/env sh

sudo pacman -S --needed \
    bluez \
    bluez-utils \
    bluez-libs \
    blueman

modprobe btusb

sudo systemctl enable bluetooth.service
