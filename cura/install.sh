#!/bin/bash

sudo mkdir -p /opt/cura

sudo cp ./icon.png /opt/cura

sudo wget -O /tmp/cura.AppImage https://github.com/Ultimaker/Cura/releases/download/5.1.0/Ultimaker-Cura-5.1.0-linux.AppImage
chmod +x /tmp/cura.AppImage

sudo mv /tmp/cura.AppImage /opt/cura/

mkdir -p ~/.local/share/applications/
cp ./cura.desktop ~/.local/share/applications/
