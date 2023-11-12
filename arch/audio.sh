#!/usr/bin/env sh

echo "Installing audio packages"
sudo pacman -S --needed \
    pipewire \
    pipewire-alsa \
    pipewire-pulse \
    libpulse \
    pipewire-audio \
    pipewire-jack \
    gst-plugin-pipewire \
    libpipewire \
    wireplumber \
    libwireplumber \
    pavucontrol \
    playerctl
