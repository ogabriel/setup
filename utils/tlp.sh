#!/usr/bin/env bash

if which apt; then
    sudo add-apt-repository ppa:linrunner/tlp -y
    sudo apt update
    sudo apt remove -y power-profiles-daemon
    sudo apt install -y tlp tlp-rdw
elif which pacman; then
    sudo pacman -R --noconfirm power-profiles-daemon

    # https://wiki.archlinux.org/title/TLP
    sudo pacman -S --noconfirm tlp tlp-rdw
    sudo systemctl enable tlp.service
    sudo systemctl enable NetworkManager-dispatcher.service
    sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket

    yay -S --noconfirm tlpui
fi

sudo tlp start
