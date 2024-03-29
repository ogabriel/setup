#!/usr/bin/env sh

./arch/yay.sh
./arch/sddm.sh
./arch/audio.sh
./arch/bluetooth.sh
./arch/screen.sh
./arch/network.sh
./arch/gnome.sh
./arch/fonts.sh
./arch/thunar.sh

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

sudo pacman -S git

if [ ! -d ~/.dotfiles ]; then
    cd
    git clone https://github.com/ogabriel/.dotfiles.git
fi
cd ~/.dotfiles
./hypr/install.sh
./waybar/install_hyprland.sh
./rofi/install.sh
./swayidle/install_hyprland.sh
./swaylock/install.sh
