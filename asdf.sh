#!/bin/bash
# asdf versions

cd

echo 'Updating and upgrading'

sudo apt-get install dialog
cmd=(dialog --separate-output --checklist "Please select software you want to install: " 22 76 16)
options=(
        1 "asdf basic" off
        2 "ruby" off
        3 "nodejs" off
        4 "erlang" off
        5 "elixir" off
        6 "rust" off
        7 "java" off
        8 "python" off
        9 "golang" off)
        choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
        clear

for choice in $choices
do
    case $choice in
        1)
            sudo apt install \
              automake autoconf libreadline-dev \
              libncurses-dev libssl-dev libyaml-dev \
              libxslt-dev libffi-dev libtool unixodbc-dev \
              unzip -y

            git clone https://github.com/asdf-vm/asdf.git ~/.asdf
            cd ~/.asdf
            git checkout "$(git describe --abbrev=0 --tags)"
            echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
            echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc

            source ~/.bashrc

            asdf update
            ;;
        2)
            asdf plugin-add ruby
            asdf install ruby 2.6.1
            asdf global ruby 2.6.1
            ;;
        3)
            asdf plugin-add nodejs
            bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
            asdf install nodejs 12.0.0
            asdf global nodejs 12.0.0
            ;;
        4)
            asdf plugin-add erlang
            asdf install erlang 20.3.8.21
            asdf global erlang 20.3.8.21
            ;;
        5)
            asdf plugin-add elixir
            asdf install elixir 1.8.1
            asdf global elixir 1.8.1
            ;;
        6)
            asdf plugin-add rust
            asdf install rust 1.34.1
            asdf global rust 1.34.1
            ;;
        7)
            asdf plugin-add java
            asdf install java openjdk-11.0.1
            asdf global java openjdk-11.0.1
            ;;
        8)
            asdf plugin-add python
            asdf install python 3.7.3
            asdf global python 3.7.3
            ;;
        9)
            asdf plugin-add golang 1.12.4
            asdf install golang 1.12.4
            asdf global golang 1.12.4
            ;;
    esac
done
