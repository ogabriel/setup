#!/bin/sh

set -e

cd /tmp

FILENAME=nvim-linux64.deb
FILENAME_SHA=nvim-linux64.deb.sha256sum

wget -O /tmp/$FILENAME https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.deb
wget -O /tmp/$FILENAME_SHA https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.deb.sha256sum

sha256sum -c /tmp/$FILENAME_SHA

sudo dpkg -i /tmp/$FILENAME
