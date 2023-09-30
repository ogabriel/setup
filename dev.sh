#!/bin/bash

mkdir -p ~/tmp
cd ~/tmp

sudo apt-get install -y dialog
cmd=(dialog --separate-output --checklist "Please select software you want to install: " 22 76 16)
options=(
    1 "load my dotfiles config" off
    2 "vim" off
    3 "neovim" off
    4 "vscode" off
    5 "docker-ce" off
    6 "docker-composer & machine" off
    7 "postman" off
    8 "kubectl" off
    9 "click 0.3.2" off
    10 "gitkraken" off
    11 "dbeaver" off
    12 "minikube (kvm)" off
)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear

for choice in $choices; do
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

        echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after" >>~/.config/nvim/init.vim
        echo "let &packpath = &runtimepath" >>~/.config/nvim/init.vim
        echo "source ~/.vimrc" >>~/.config/nvim/init.vim
        cd
        ;;
    4)
        curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >microsoft.gpg
        sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
        sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
        sudo apt-get update
        sudo apt-get install -y code
        ;;
    5)
        # dependencies
        sudo apt install \
            apt-transport-https \
            ca-certificates \
            curl \
            gnupg \
            lsb-release

        # install GPG key
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

        # add repo
        echo \
            "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
              $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

        # install
        sudo apt update
        sudo apt install docker-ce docker-ce-cli containerd.io

        # add group to use docker without sudo
        sudo groupadd docker
        sudo usermod -aG docker $USER

        # ubuntu should already have this, but just in case
        # sudo systemctl enable docker.service
        # sudo systemctl enable containerd.service
        ;;
    6)
        sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        sudo chmod +x /usr/local/bin/docker-compose

        curl -L https://github.com/docker/machine/releases/download/v0.13.0/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
            chmod +x /tmp/docker-machine &&
            sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
        ;;
    7)
        wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
        sudo tar -xzf postman.tar.gz -C /opt
        rm postman.tar.gz
        sudo ln -s /opt/Postman/Postman /usr/bin/postman
        mkdir ~/.local/share/applications/
        cat >~/.local/share/applications/postman.desktop <<EOL
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
    8)
        sudo apt-get update && sudo apt-get install -y apt-transport-https
        curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
        echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
        sudo apt-get update
        sudo apt-get install -y kubectl
        ;;
    9)
        echo "this installation require manually installation of rust C-c to cancel (https://www.rust-lang.org/tools/install)"
        read
        # cloning click and installing click
        rustup
        git clone https://github.com/databricks/click.git ~/.click
        cd ~/.click
        git checkout bc3b95a7a3ba88f1dcc3bb0eed8239c03545de10
        cargo build --release
        # now you can execute ./target/debug/click to run it
        echo "alias click=~/.click/target/release/click" >>~/.bashrc
        cd
        ;;
    10)
        sudo apt-get install gvfs-bin
        wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
        sudo dpkg -i gitkraken-amd64.deb
        rm gitkraken-amd64.deb
        ;;
    11)
        sudo add-apt-repository ppa:serge-rider/dbeaver-ce
        sudo apt-get update
        sudo apt-get install -y dbeaver-ce
        ;;
    12)
        # install minikube
        curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 &&
            chmod +x minikube

        sudo install minikube /usr/local/bin

        # install kvm qemu
        sudo apt install libvirt-clients libvirt-daemon-system qemu-kvm

        curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-kvm2 &&
            sudo install docker-machine-driver-kvm2 /usr/local/bin/

        sudo systemctl enable libvirtd.service
        sudo systemctl start libvirtd.service
        sudo systemctl status libvirtd.service

        sudo usermod -a -G libvirt $(whoami)

        minikube config set vm-driver kvm2

        sudo chown -R $USER $HOME/.kube
        sudo chown -R $USER $HOME/.minikube
        ;;
    esac
done

source ~/.bashrc
