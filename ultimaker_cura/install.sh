#!/bin/bash

mkdir -p /opt/cura

cp ./ultimaker_cura.png /opt/cura

wget -O cura https://github.com/Ultimaker/Cura/releases/download/5.1.0/Ultimaker-Cura-5.1.0-linux.AppImage /opt/cura/
chmod +x /opt/cura/cura

mkdir -p ~/.local/share/applications/
cp ./ultimaker_cura.desktop ~/.local/share/applications/

mkdir -p ~/.local/bin
ln -s /opt/cura/cura ~/.local/bin/cura
