#!/bin/bash

sudo mkdir -p /opt/vial

cp ./vial.desktop ~/.local/share/applications/

sudo cp ./icon.png /opt/vial

wget -O /tmp/vial.AppImage https://github.com/vial-kb/vial-gui/releases/download/v0.6/Vial-v0.6-x86_64.AppImage

chmod +x /tmp/vial.AppImage

sudo mv /tmp/vial.AppImage /opt/vial/
