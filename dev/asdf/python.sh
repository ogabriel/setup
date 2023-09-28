#!/usr/bin/env bash

if [ -f "/etc/arch-release" ]; then
    pacman -S --needed base-devel openssl zlib xz tk
elif [ -f "/etc/lsb-release" ]; then
    sudo apt install build-essential libssl-dev zlib1g-dev \
        libbz2-dev libreadline-dev libsqlite3-dev curl \
        libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
fi

asdf plugin add python
asdf plugin update python
asdf install python 3.11.5
asdf global python 3.11.5
