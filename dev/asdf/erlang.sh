#!/usr/bin/env bash

if which apt; then
    sudo apt install -y \
        build-essential \
        autoconf \
        m4 \
        libncurses5-dev \
        libwxgtk3.0-gtk3-dev \
        libwxgtk-webview3.0-gtk3-dev \
        libgl1-mesa-dev \
        libglu1-mesa-dev \
        libpng-dev \
        libssh-dev \
        unixodbc-dev \
        xsltproc \
        fop \
        libxml2-utils \
        libncurses-dev
elif which pacman; then
    sudo pacman -S --noconfirm --needed \
        base-devel \
        ncurses \
        glu \
        mesa \
        wxwidgets-gtk3 \
        libpng \
        libssh \
        unixodbc \
        libxslt \
        fop
fi

asdf plugin add erlang
asdf plugin update erlang

VERSION=${1:-$(asdf latest erlang)}

KERL_BUILD_DOCS=yes KERL_CONFIGURE_OPTIONS="--without-javac" asdf install erlang $VERSION
asdf global erlang $VERSION
