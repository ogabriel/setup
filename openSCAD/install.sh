#!/bin/bash

# source of the fix to icons: https://github.com/openscad/openscad/issues/3523#issuecomment-861524760

cd /tmp

wget -O /tmp/openscad https://files.openscad.org/OpenSCAD-2021.01-x86_64.AppImage
chmod +x /tmp/openscad
/tmp/openscad --appimage-extract

cp /usr/lib/x86_64-linux-gnu/libcairo.so.2 /tmp/squashfs-root/usr/lib/libcairo.so.2

wget -O /tmp/appimagetool https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage
chmod +x /tmp/appimagetool

/tmp/appimagetool /tmp/squashfs-root

mv /tmp/OpenSCAD-x86_64.AppImage /tmp/openscad

sudo mkdir -p /opt/openscad

sudo mv /tmp/openscad /opt/openscad
sudo chmod +x /opt/openscad/openscad

mkdir -p ~/.local/share/applications/
cp ./openscad.desktop ~/.local/share/applications/

sudo cp ./icon.png /opt/openscad/
