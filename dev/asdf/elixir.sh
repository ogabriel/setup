#!/usr/bin/env bash

if which apt; then
    sudo apt-get install unzip inotify-tools -y
elif which pacman; then
    sudo pacman -S unzip inotify-tools --noconfirm --needed

fi

asdf update

asdf plugin add elixir

asdf plugin update elixir

# compatibility list for erlang and elixir
# https://hexdocs.pm/elixir/compatibility-and-deprecations.html#compatibility-between-elixir-and-erlang-otp

asdf install elixir latest

asdf global elixir latest
