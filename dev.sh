#!/bin/bash
cd

echo 'Updating and upgrading'
sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install -y dialog
cmd=(dialog --separate-output --checklist "Please select software you want to install: " 22 76 16)
options=(
        1 "load my dotfiles config" off
        2 "vim" off
        3 "neovim" off
        4 "vscode" off
        5 "docker-ce" off
        6 "postman" off
        7 "kubectl" off
        8 "click 0.3.2" off
        9 "gitkraken" off
        10 "dbeaver" off
        )
        choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
        clear

for choice in $choices
do
    case $choice in
        1)
            cd
            git clone git@github.com:ogabriel/.dotfiles.git
            cd ~/.dotfiles
            ./install.sh
            ./st.sh
            ;;
        2)
            apt-get install -y vim
            ;;
        3)
            sudo apt-get install -y neovim

            mkdir .config/nvim/

            echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after" >> ~/.config/nvim/init.vim
            echo "let &packpath = &runtimepath" >> ~/.config/nvim/init.vim
            echo "source ~/.vimrc" >> ~/.config/nvim/init.vim
            cd
            ;;
        4)
            curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
            sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
            sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
            sudo apt-get update
            sudo apt-get install -y code
            ;;
        5)
            # install repository
            sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
            sudo apt-key fingerprint 0EBFCD88
            sudo add-apt-repository \
                "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
                $(lsb_release -cs) \
                stable"
            # really install now
            sudo apt-get update
            sudo apt-get install docker-ce docker-ce-cli containerd.io
            ;;
        6)
            wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
            sudo tar -xzf postman.tar.gz -C /opt
            rm postman.tar.gz
            sudo ln -s /opt/Postman/Postman /usr/bin/postman
            mkdir ~/.local/share/applications/
            cat > ~/.local/share/applications/postman.desktop <<EOL
            [Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=postman
Icon=/opt/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOL
;;
        7)
            sudo apt-get update && sudo apt-get install -y apt-transport-https
            curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
            echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
            sudo apt-get update
            sudo apt-get install -y kubectl
            ;;
        8)
            echo "this installation require manually installation of rust C-c to cancel (https://www.rust-lang.org/tools/install)"
            read
            # cloning click and installing click
            rustup
            git clone https://github.com/databricks/click.git ~/.click
            cd ~/.click
            git checkout bc3b95a7a3ba88f1dcc3bb0eed8239c03545de10
            cargo build --release
            # now you can execute ./target/debug/click to run it
            echo "alias click=~/.click/target/release/click" >> ~/.bashrc
            cd
            ;;
        9)
            sudo apt-get install gvfs-bin
            wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
            sudo dpkg -i gitkraken-amd64.deb
            rm gitkraken-amd64.deb
            ;;
        10)
            sudo add-apt-repository ppa:serge-rider/dbeaver-ce
            sudo apt-get update
            sudo apt-get install -y dbeaver-ce
            ;;
    esac
done

source ~/.bashrc
