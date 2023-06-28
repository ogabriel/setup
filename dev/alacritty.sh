#!/bin/bash

if which apt; then
    sudo apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 libegl1-mesa-dev gzip

    cd
    mkdir -p opensource
    cd opensource
    git clone https://github.com/alacritty/alacritty.git && cd alacritty || cd alacritty && git pull

    rustup override set stable
    rustup update stable

    cargo build --release

    # terminal entry
    infocmp alacritty || sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

    # bin and desktop
    sudo cp target/release/alacritty /usr/local/bin
    sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
    sudo desktop-file-install extra/linux/Alacritty.desktop
    sudo update-desktop-database

    # man page
    sudo mkdir -p /usr/local/share/man/man1
    gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
    gzip -c extra/alacritty-msg.man | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null

    # bash completition
    mkdir -p ~/.bash_completion.d
    cp extra/completions/alacritty.bash ~/.bash_completion.d/alacritty
    echo "source ~/.bash_completion.d/alacritty" >> ~/.bashrc

    # register terminal
    sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/alacritty 50
fi
