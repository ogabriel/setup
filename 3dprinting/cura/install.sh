#!/bin/bash

# create folder
sudo mkdir -p /opt/cura

# add icon
sudo cp ./icon.png /opt/cura

# create shortcut
mkdir -p ~/.local/share/applications/
cp ./cura.desktop ~/.local/share/applications/

# download appimage
sudo wget -O /tmp/cura.AppImage https://github.com/Ultimaker/Cura/releases/download/5.1.0/Ultimaker-Cura-5.1.0-linux.AppImage
chmod +x /tmp/cura.AppImage

sudo mv /tmp/cura.AppImage /opt/cura/
