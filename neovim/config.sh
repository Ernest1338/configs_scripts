#!/bin/bash

if ! [ $(id -u) = 0 ]; then
	echo "Script modifies system wide neovim config aswell, sudo required" && exit 1
fi
if [ -z "$1" ]; then # if $1 is zero, display usage
	echo "Usage: sudo ./config.sh install/update/repo" && exit 1
fi
if [ $1 == "install" ] || [ $1 == "update" ]; then
	read -p "About to overwrite your current config, proceed? [y/n]: " confirm
	if [[ "$confirm" == [yY] ]]; then
		echo "Git pull:" &&
		git pull &&
		mkdir -p ~/.config/nvim/lua/ &&
		echo "Installing fresh configs..." &&
		sudo cat ../neovim_global/sysinit.vim > /etc/xdg/nvim/sysinit.vim &&
		cat ./init.lua > ~/.config/nvim/init.lua &&
		cat ./lua/config.lua > ~/.config/nvim/lua/config.lua &&
		cat ./lua/keybindings.lua > ~/.config/nvim/lua/keybindings.lua &&
		cat ./lua/plugins.lua > ~/.config/nvim/lua/plugins.lua
	else
		echo "Aborting..."
	fi
elif [ $1 == "repo" ]; then
	echo "Updating repo with the local configs..." &&
	cat ~/.config/nvim/init.lua > ./init.lua &&
	cat ~/.config/nvim/lua/config.lua > ./lua/config.lua &&
	cat ~/.config/nvim/lua/keybindings.lua > ./lua/keybindings.lua &&
	cat ~/.config/nvim/lua/plugins.lua > ./lua/plugins.lua
else
	echo "Usage: sudo ./config.sh install/update/repo"
fi

