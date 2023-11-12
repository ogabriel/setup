#!/usr/bin/env sh

echo "Installing SDDM"
sudo pacman -S --needed --no-confirm sddm

echo "Enabling SDDM"
sudo systemctl enable sddm.service
