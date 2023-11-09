#!/usr/bin/env sh

sudo pacman -S --needed --no-confirm \
    pipewire \
    pipewire-alsa \
    pipewire-pulse \
    pipewire-audio \
    pipewire-jack \
    libpipewire \
    wireplumber \
    libwireplumber
