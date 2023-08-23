#!/bin/bash

# create folder
sudo mkdir -p /opt/prusaslicer

# add icon
sudo cp ./icon.png /opt/prusaslicer

# create shortcut
mkdir -p ~/.local/share/applications/
cp ./prusaslicer.desktop ~/.local/share/applications/

# download appimage
wget -O /tmp/prusaslicer.AppImage https://github.com/prusa3d/PrusaSlicer/releases/download/version_2.6.0/PrusaSlicer-2.6.0+linux-x64-GTK3-202306191220.AppImage

chmod +x /tmp/prusaslicer.AppImage

sudo mv /tmp/prusaslicer.AppImage /opt/prusaslicer/
