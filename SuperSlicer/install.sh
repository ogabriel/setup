#!/bin/bash

script_dir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")

# create folder
sudo mkdir -p /opt/superslicer

# add icon
sudo cp "$script_dir/icon.png" /opt/superslicer

# create shortcut
mkdir -p ~/.local/share/applications/
cp "$script_dir/superslicer.desktop" ~/.local/share/applications/
