#!/usr/bin/env sh

./setup/arch/audio.sh
./setup/arch/bluetooth.sh

sudo pacman -S -needed \
    qt5-wayland \
    qt6-wayland \
    xdg-desktop-portal \
    xdg-desktop-portal-hyprland \
    dunst \
    grim \
    slurp
