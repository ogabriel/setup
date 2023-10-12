#!/usr/bin/env bash

if [ -f "/etc/arch-release" ]; then
    pacman -S --noconfirm --needed \
        base-devel \
        openssl \
        zlib \
        xz \
        tk
elif [ -f "/etc/lsb-release" ]; then
    sudo apt install -y \
        build-essential \
        libssl-dev \
        zlib1g-dev \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev \
        curl \
        libncursesw5-dev \
        xz-utils \
        tk-dev \
        libxml2-dev \
        libxmlsec1-dev \
        libffi-dev \
        liblzma-dev
fi

asdf plugin add python
asdf plugin update python

VERSION=${1:-$(asdf list all python | grep -v "[a-z]" | tail -n 1)}

asdf install python $VERSION
asdf global python $VERSION
