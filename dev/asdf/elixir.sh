#!/usr/bin/env bash

if which apt; then
    sudo apt-get install unzip inotify-tools -y
elif which pacman; then
    sudo pacman -S unzip inotify-tools --noconfirm --needed
fi

asdf plugin add elixir
asdf plugin update elixir

# compatibility list for erlang and elixir:
# https://hexdocs.pm/elixir/compatibility-and-deprecations.html#compatibility-between-elixir-and-erlang-otp
# Elixir precompiled versions:
# the default OTP version of a raw elixir install will always be an older/oldest version, so prefer to specify the
# OTP version when installing elixir, as it allows to use the most advanced features of OTP, examples:
# 1.14.4 = 1.14.4-otp-23 (oldest)
# 1.14.5 = 1.14.5-otp-24 (older, but not the oldest)
VERSION=${1:-$(asdf list all elixir | grep -v master | grep -v main | tail -n 1)}

asdf install elixir $VERSION
asdf global elixir $VERSION
