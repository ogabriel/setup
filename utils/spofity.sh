#!/usr/bin/env bash

if which apt; then
    sudo apt-get install wget -y
    wget -O- https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
    sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free"
    sudo apt-get update
    sudo apt-get install spotify-client -y --allow-unauthenticated
fi
