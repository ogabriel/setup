#!/usr/bin/env bash

if [ -f "/etc/arch-release" ]; then
    sudo pacman -S --noconfirm bash curl sha256sum unzip jq
elif [ -f "/etc/lsb-release" ]; then
    sudo apt-get install bash curl sha256sum unzip jq
fi

asdf plugin add java
asdf plugin update java

LAST_OPENJDK_17_VERSION=$(asdf list all java | grep openjdk-16 | tail -n 1)

asdf install java $LAST_OPENJDK_17_VERSION
asdf global java $LAST_OPENJDK_17_VERSION
