#!/usr/bin/env bash

if which apt; then
    apt-get -y install \
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
        libncurses-dev \
        openjdk-11-jdk -y
elif which pacman; then
    sudo pacman -S \
        base-devel \
        ncurses \
        glu \
        mesa \
        wxwidgets-gtk3 \
        libpng \
        libssh \
        unixodbc \
        libxslt \
        fop \
        --noconfirm \
        --needed
fi

asdf update
asdf plugin add erlang
asdf plugin update erlang
KERL_BUILD_DOCS=yes KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac" asdf install erlang latest
asdf global erlang latest
