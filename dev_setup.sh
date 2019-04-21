#!/bin/bash
cd

echo 'Updating and upgrading'
sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install -y dialog
cmd=(dialog --separate-output --checklist "Please select software you want to install: " 22 76 16)
options=(
	1 "asdf" on
	2 "dbeaver" off
	3 "neovim" off
	4 "gitkraken" off
	5 "postman (latest)" off
	)
	choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
	clear
for choice in $choices
do
case $choice in
    1)
	sudo apt install \
	  automake autoconf libreadline-dev \
	  libncurses-dev libssl-dev libyaml-dev \
	  libxslt-dev libffi-dev libtool unixodbc-dev
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf
	cd ~/.asdf
	git checkout "$(git describe --abbrev=0 --tags)"
	echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
	echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
	asdf update
	;;
    2)
	sudo add-apt-repository ppa:serge-rider/dbeaver-ce
	sudo apt-get update
	sudo apt-get install -y dbeaver-ce
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
	sudo apt-get install gvfs-bin
	wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
	sudo dpkg -i gitkraken-amd64.deb
	rm gitkraken-amd64.deb
	;;
    5)
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
    esac
done

