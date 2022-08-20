#!/bin/bash

sudo mkdir -p /opt/cura

sudo cp ./cura.png /opt/cura

sudo wget -O /opt/cura/cura https://github.com/Ultimaker/Cura/releases/download/5.1.0/Ultimaker-Cura-5.1.0-linux.AppImage
sudo chmod +x /opt/cura/cura

mkdir -p ~/.local/share/applications/
cp ./cura.desktop ~/.local/share/applications/
