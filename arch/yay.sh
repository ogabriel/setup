#!/usr/bin/env sh

sudo pacman -S --needed --no-confirm git base-devel

cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
