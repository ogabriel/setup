#!/bin/bash

cd /tmp
git clone https://github.com/davatorium/rofi.git

cd rofi/

aclocal
automake
automake --add-missing

mkdir -p build
cd build

sudo apt install flex libxcb-util-dev libpango1.0-dev libxcb-cursor-dev libxcb-xkb-dev libxkbcommon-x11-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-randr0-dev -y

 ../configure

make
make install

# if make does not work
# meson setup build
# ninja -C build
# ninja -C build install
