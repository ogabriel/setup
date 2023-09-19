#!/bin/sh

set -e

if which apt; then
    sudo apt-get install ninja-build gettext cmake unzip curl
elif which pacman; then
    sudo pacman -S base-devel cmake unzip ninja curl
fi

cd /tmp
rm -rf /tmp/neovim

git clone https://github.com/neovim/neovim

cd neovim

git checkout stable

make CMAKE_BUILD_TYPE=RelWithDebInfo

if which apt; then
    cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb
elif which pacman; then
    sudo make install
fi
