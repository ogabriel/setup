#!/usr/bin/env sh

./arch/yay.sh
./arch/audio.sh
./arch/bluetooth.sh
./arch/screenl.sh
./arch/network.sh

echo "Installing hypland base packages"
sudo pacman -R xdg-desktop-portal-gtk xdg-desktop-portal-wlr
sudo pacman -S --needed \
    qt5-wayland \
    qt6-wayland \
    xdg-desktop-portal \
    xdg-desktop-portal-hyprland \
    mako \
    alacritty \
    swayidle \
    swaylock

yay -S \
    python-pywal \
    wpgtk \
    rofi-lbonn-wayland
