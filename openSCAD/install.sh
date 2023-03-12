#!/bin/bash

# create folder
sudo mkdir -p /opt/openscad

# add icon
sudo cp ./icon.png /opt/openscad/

# create shortcut
mkdir -p ~/.local/share/applications/
cp ./openscad.desktop ~/.local/share/applications/

cd /tmp

# download appimage and fix: https://github.com/openscad/openscad/issues/3523#issuecomment-861524760
wget -O /tmp/openscad.AppImage https://files.openscad.org/OpenSCAD-2021.01-x86_64.AppImage
chmod +x /tmp/openscad.AppImage
/tmp/openscad.AppImage --appimage-extract

cp /usr/lib/x86_64-linux-gnu/libcairo.so.2 /tmp/squashfs-root/usr/lib/libcairo.so.2

wget -O /tmp/appimagetool.AppImage https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage
chmod +x /tmp/appimagetool.AppImage

/tmp/appimagetool.AppImage /tmp/squashfs-root

chmod +x /tmp/OpenSCAD-x86_64.AppImage

sudo mv /tmp/OpenSCAD-x86_64.AppImage /opt/openscad/openscad.AppImage
