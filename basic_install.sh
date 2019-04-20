# install basic shit

apt-get install -y dialog
cmd=(dialog --separate-output --checklist "Select the type: " 22 76 16)
options=(
	1 "ricer" on
	2 "dev_install" on
	3 "rails dependencies" on
	)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear

for choice in $choices
do
	case $choice in
	1)
		sudo apt-get install i3 xorg network-mananger-gnome neofetch \
		ranger thunar chromium pulseaudio blueman \
		rxvt-unicode sudo feh build-essentials lm-sensors
	;;
	2)
		sudo apt-get install -y curl wget software-properties-common build-essential libyaml-dev libssl-dev libgdbm-dev \
		libncurses5-dev libpq-dev libffi-dev make gcc g++ autoconf bison libyaml-dev libreadline7  \
		libreadline-dev zlib1g zlib1g-dev openssl libssl-dev libssl-dev libyaml-dev
	;;
	3)
		sudo apt-get install -y libxml2 libxml2-dev libxslt1-dev liblzma-dev

		sudo apt-get install -y libmagick++-dev libcurl3-dev
	    	sudo apt-get install -y sqlite3 libsqlite3-dev \
			mysql-server libmysqlclient-dev \
			postgresql postgresql-client postgresql-contrib libpq-dev \
			redis-server memcached imagemagick ffmpeg mupdf mupdf-tools \
			libaio1
	;;

    esac
done

