#!/bin/sh

set -e

echo "Installing Neovim"

if [ -f /etc/arch-release ]; then
    sudo pacman -S neovim --noconfirm
elif [ -f /etc/lsb-release ]; then
    sudo apt-get install ninja-build gettext cmake unzip curl

    cd /tmp
    rm -rf /tmp/neovim

    git clone https://github.com/neovim/neovim

    cd neovim

    git checkout stable

    make CMAKE_BUILD_TYPE=RelWithDebInfo

    cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb
fi
