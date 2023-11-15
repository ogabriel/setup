#!/usr/bin/env sh

if [ -z "$(command -v yay)" ]; then
    echo "Installing yay..."

    sudo pacman -S --needed --noconfirm git base-devel

    cd /tmp
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si
fi
