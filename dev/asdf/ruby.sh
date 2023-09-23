#!/usr/bin/env bash

if which apt; then
    sudo apt-get install autoconf patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev -y
elif which pacman; then
    # maybe is needed
    # yay -S gcc6 --noconfirm
    sudo pacman -S base-devel rust libffi libyaml openssl zlib --noconfirm --needed
fi

asdf update

asdf plugin add ruby

asdf plugin update ruby
