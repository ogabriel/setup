#!/bin/bash

mkdir -p /opt/cura

cp ./cura.png /opt/cura

wget -O /opt/cura/cura https://github.com/Ultimaker/Cura/releases/download/5.1.0/Ultimaker-Cura-5.1.0-linux.AppImage
chmod +x /opt/cura/cura

mkdir -p ~/.local/share/applications/
cp ./cura.desktop ~/.local/share/applications/

mkdir -p ~/.local/bin
ln -s /opt/cura/cura ~/.local/bin/cura
