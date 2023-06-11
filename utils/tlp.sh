#!/usr/bin/env bash

if which apt; then
    sudo apt remove power-profiles-daemon
    sudo apt install tlp tlp-rdw -y
elif which pacman; then
    sudo pacman -S tlp tlp-rdw --noconfirm
    systemctl enable tlp.service
    systemctl mask systemd-rfkill.service systemd-rfkill.socket
    systemctl enable NetworkManager-dispatcher.service
fi

sudo cp utils/tlp/* /etc/tlp.d/

sudo tlp start
