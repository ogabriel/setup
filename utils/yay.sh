#!/usr/bin/env bash

sudo pacman -S -S --noconfirm --needed git base-devel
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
