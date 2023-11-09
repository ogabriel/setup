#!/usr/bin/env sh

sudo pacman -S --needed --no-confirm \
    bluez \
    bluez-utils \
    bluez-libs \
    blueman

modprobe btusb

sudo systemctl enable bluetooth.service
