#!/bin/bash

cd

sudo apt-get install dialog
cmd=(dialog --separate-output --checklist "Please select software you want to install: " 22 76 16)
options=(
        1 "asdf (manager)" on
        2 "ruby" off
        3 "nodejs" off
        4 "erlang" off
        5 "elixir" off
        6 "rust" off
        7 "java" off
        8 "python" off
        9 "golang" off
        10 "bloat deps" off)
        choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
        clear

for choice in $choices
do
    case $choice in
        1)
            # ASDF

            sudo apt install curl git -y

            git clone https://github.com/asdf-vm/asdf.git ~/.asdf
            cd ~/.asdf
            git checkout "$(git describe --abbrev=0 --tags)"

            echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
            echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc

            source ~/.bashrc

            asdf update
            ;;
        2)
            # RUBY

            sudo apt install \
                autoconf \
                bison \
                build-essential \
                libssl-dev \
                libyaml-dev \
                libreadline6-dev \
                zlib1g-dev \
                libncurses5-dev \
                libffi-dev \
                libgdbm6 \
                libgdbm-dev \
                libdb-dev

            asdf plugin-add ruby
            ;;
        3)
            # NODEJS

            sudo apt install \
                dirmngr \
                gpg \
                curl
                gawk

            asdf plugin-add nodejs
            ;;
        4)
            # ERLANG

            # basic
            sudo apt install \
                build-essential \
                autoconf

            # native support
            sudo apt install m4

            # terminal
            sudo apt install libncurses-dev libncurses5-dev

            # xml
            sudo apt install libxml2-utils

            # odbc
            # sudo apt install unixodbc-dev

            # wxWidgets
            # sudo apt install \
            #     libwxgtk3.0-gtk3-dev \
            #     libgl1-mesa-dev \
            #     libglu1-mesa-dev \
            #     libpng-dev

            # support to docs, but it needs to install java and a lot of other things
            # sudo apt install \
            #     xsltproc \
            #     fop

            asdf plugin-add erlang
            ;;
        5)
            # ELIXIR

            # compatibility list for erlang and elixir
            # https://hexdocs.pm/elixir/master/compatibility-and-deprecations.html#compatibility-between-elixir-and-erlang-otp
            asdf current erlang && asdf plugin-add elixir
            ;;
        6)
            # RUST

            sudo apt install \
                build-essential \
                libssl-dev \
                pkg-config

            asdf plugin-add rust
            ;;
        7)
            # JAVA

            sudo apt install \
                autoconf \
                bash \
                make \
                curl \
                coreutils
                unzip \
                jq

            asdf plugin-add java
            ;;
        8)
            # PYTHON

            sudo apt install \
                make \
                build-essential \
                libssl-dev \
                zlib1g-dev \
                libbz2-dev \
                libreadline-dev \
                libsqlite3-dev \
                wget \
                curl \
                llvm \
                libncursesw5-dev \
                xz-utils \
                tk-dev \
                libxml2-dev \
                libxmlsec1-dev \
                libffi-dev \
                liblzma-dev

            asdf plugin-add python
            ;;
        9)
            # GOLANG

            sudo apt install \
                coreutils \
                curl

            asdf plugin-add golang
            ;;
        10)
            # BLOAT DEPS
            # these are deprecated dependencies that are probably used on something,
            # but i dont have any idea if they are really necessary

            # old asdf deps
            sudo apt install \
                automake autoconf libreadline-dev \
                libncurses-dev libssl-dev libyaml-dev \
                libxslt-dev libffi-dev libtool unixodbc-dev \
                unzip -y

            # old deps
            sudo apt-get install \
                curl wget software-properties-common build-essential libyaml-dev libssl-dev libgdbm-dev \
		libncurses5-dev libpq-dev libffi-dev make gcc g++ autoconf bison libyaml-dev libreadline7  \
		libreadline-dev zlib1g zlib1g-dev openssl libssl-dev libssl-dev libyaml-dev
            ;;
    esac
done
