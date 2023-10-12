#!/usr/bin/env bash

if which apt; then
    sudo apt-get -y \
        install \
        autoconf \
        patch \
        build-essential \
        rustc \
        libssl-dev \
        libyaml-dev \
        libreadline6-dev \
        zlib1g-dev \
        libgmp-dev \
        libncurses5-dev \
        libffi-dev \
        libgdbm6 \
        libgdbm-dev \
        libdb-dev \
        uuid-dev
elif which pacman; then
    # maybe is needed
    # yay -S gcc6 --noconfirm
    sudo pacman -S --noconfirm --needed \
        base-devel \
        rust \
        libffi \
        libyaml \
        openssl \
        zlib
fi

asdf plugin add ruby
asdf plugin update ruby

VERSION=${1:-$(asdf list all ruby | grep -v -e truffleruby -e ree -e rbx -e mruby -e jruby -e artichoke -e maglev -e picoruby -e preview -e rc -e dev | tail -n 1)}

asdf install ruby $VERSION
asdf global ruby $VERSION
