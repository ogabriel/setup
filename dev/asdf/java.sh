#!/usr/bin/env bash

if [ -f "/etc/arch-release" ]; then
    sudo pacman -S \
        --noconfirm \
        --needed \
        bash \
        curl \
        coreutils \
        unzip \
        jq
elif [ -f "/etc/lsb-release" ]; then
    sudo apt-get install bash curl sha256sum unzip jq
fi

asdf plugin add java
asdf plugin update java

VERSION=${1:-$(asdf list all java | grep openjdk-17 | tail -n 1)}

asdf install java $VERSION
asdf global java $VERSION
