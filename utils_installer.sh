#!/bin/bash

cd

echo "It is important to say that all of this files were tested just at an ubuntu machine"
echo "First, make sure you used the first package, some applications here can only be installed after the basic_install.sh\nAny key to confirm and <C-c> to cancel"
read

    echo 'Updating and upgrading'
    sudo apt-get update && sudo apt-get upgrade -y

    sudo apt-get install dialog
    cmd=(dialog --separate-output --checklist "Please select software you want to install: " 22 76 16)
    options=(
            1 "spotity" on
            2 "tmux" on
            3 "chromium" on)
	    choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
            clear
for choice in $choices
do
    case $choice in
        1)
            sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free"
            # somethimes this key can give you some problemes, so find another online
            sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A87FF9DF48BF1C90
            sudo apt-get update
            sudo apt-get install spotify-client -y --allow-unauthenticated
            ;;
        2)
            sudo apt-get install tmux -y
            echo "probaly you are interested tmux\nHere are some links that you may wanna try, if it is your first configuration:\nhttps://github.com/gpakosz/.tmux"
            read
            ;;
        3)
            sudo apt-get install chromium-browser -y
            ;;
    esac
done
