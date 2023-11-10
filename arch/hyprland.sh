#!/usr/bin/env sh

./arch/audio.sh
./arch/bluetooth.sh

sudo pacman -S -needed \
    qt5-wayland \
    qt6-wayland \
    xdg-desktop-portal \
    xdg-desktop-portal-hyprland \
    dunst \
    grim \
    slurp
