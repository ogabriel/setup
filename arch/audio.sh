#!/usr/bin/env sh

sudo pacman -S --needed --noconfirm \
    pipewire \
    pipewire-alsa \
    pipewire-pulse \
    pipewire-audio \
    pipewire-jack \
    libpipewire \
    wireplumber \
    libwireplumber
