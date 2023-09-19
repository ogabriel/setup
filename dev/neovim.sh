#!/bin/sh
# #
if which apt; then
    sudo apt-get install ninja-build gettext cmake unzip curl
elif which pacman; then
    sudo pacman -S base-devel cmake unzip ninja curl
fi

set -e

cd /tmp
rm -rf /tmp/neovim

sudo apt-get install ninja-build gettext cmake unzip curl

git clone https://github.com/neovim/neovim

cd neovim

git checkout stable

make CMAKE_BUILD_TYPE=RelWithDebInfo

cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb
