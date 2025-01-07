#!/usr/bin/env bash

if [ -f "/etc/arch-release" ]; then
    sudo pacman -S --noconfirm --needed \
        autoconf \
        bison \
        base-devel \
        curl \
        gettext \
        git \
        gd \
        libcurl-gnutls \
        libedit \
        icu \
        libjpeg-turbo \
        oniguruma \
        libpng \
        readline \
        sqlite \
        openssl \
        libxml2 \
        libzip \
        pkg-config \
        re2c \
        zlib
elif [ -f "/etc/lsb-release" ]; then
    sudo apt install -y \
        autoconf \
        bison \
        build-essential \
        curl \
        gettext \
        git \
        libgd-dev \
        libcurl4-openssl-dev \
        libedit-dev \
        libicu-dev \
        libjpeg-dev \
        libonig-dev \
        libpng-dev \
        libpq-dev \
        libreadline-dev \
        libsqlite3-dev \
        libssl-dev \
        libxml2-dev \
        libzip-dev \
        openssl \
        pkg-config \
        re2c \
        zlib1g-dev
fi

asdf plugin add php
asdf plugin update php

VERSION=${1:-$(asdf latest php)}

asdf install php $VERSION
asdf global php $VERSION
