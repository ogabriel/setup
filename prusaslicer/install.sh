#!/bin/bash

# create folder
sudo mkdir -p /opt/prusaslicer

# add icon
sudo cp ./icon.png /opt/prusaslicer

# create shortcut
mkdir -p ~/.local/share/applications/
cp ./prusaslicer.desktop ~/.local/share/applications/

# download appimage
sudo wget -O /tmp/prusaslicer https://cdn.prusa3d.com/downloads/drivers/prusa3d_linux_2_5_0.zip
unzip /tmp/prusaslicer -d /tmp

mv /tmp/PrusaSlicer-2.5.0+linux-x64-GTK3-202209060725.AppImage /tmp/prusaslicer.AppImage
chmod +x /tmp/prusaslicer.AppImage

sudo mv /tmp/prusaslicer.AppImage /opt/prusaslicer/
