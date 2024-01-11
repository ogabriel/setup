#!/bin/bash

if which apt; then
    sudo apt install -y thinkfan
elif which pacman; then
    yay -S --noconfirm --needed thinkfan thinkfan-ui lm_sensors
    sudo ln -s libyaml-cpp.so.0.8 /usr/lib/libyaml-cpp.so.0.7
fi
