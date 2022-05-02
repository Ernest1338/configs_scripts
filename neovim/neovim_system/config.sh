#!/bin/bash

if ! [ $(id -u) = 0 ]; then
	echo "Script modifies system wide neovim config, sudo required" && exit 1
fi
if [ -z "$1" ]; then # if $1 is zero, display usage
	echo "Usage: sudo ./config.sh install/update/repo" && exit 1
fi
if [ $1 == "install" ] || [ $1 == "update" ]; then
	read -p "About to overwrite your current config, proceed? [y/n]: " confirm
	if [[ "$confirm" == [yY] ]]; then
		echo "Git pull:" &&
		git pull &&
		echo "Installing global configs..." &&
		cat ./sysinit.vim > /etc/xdg/nvim/sysinit.vim
	else
		echo "Aborting..."
	fi
elif [ $1 == "repo" ]; then
	echo "Updating repo with the local configs..." &&
	cat /etc/xdg/nvim/sysinit.vim > ./sysinit.vim
else
	echo "Usage: sudo ./config.sh install/update/repo"
fi

