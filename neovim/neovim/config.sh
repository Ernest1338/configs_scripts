#!/bin/bash

if [ -z "$1" ]; then # if $1 is zero, display usage
	echo "Usage: ./config.sh install/update/repo" && exit 1
fi
if [ $1 == "install" ] || [ $1 == "update" ]; then
	read -p "About to overwrite your current config, proceed? [y/n]: " confirm &&
	if [[ "$confirm" == [yY] ]]; then
		echo "Git pull:" &&
		git pull &&
		mkdir -p $HOME/.config/nvim/lua/ &&
		echo "Installing fresh configs..." &&
		cat ./init.lua > $HOME/.config/nvim/init.lua &&
		cat ./lua/config.lua > $HOME/.config/nvim/lua/config.lua &&
		cat ./lua/keybindings.lua > $HOME/.config/nvim/lua/keybindings.lua &&
		cat ./lua/plugins.lua > $HOME/.config/nvim/lua/plugins.lua &&
		echo "Done"
	else
		echo "Aborting..."
	fi
elif [ $1 == "repo" ]; then
	echo "Updating repo with the local configs..." &&
	cat $HOME/.config/nvim/init.lua > ./init.lua &&
	cat $HOME/.config/nvim/lua/config.lua > ./lua/config.lua &&
	cat $HOME/.config/nvim/lua/keybindings.lua > ./lua/keybindings.lua &&
	cat $HOME/.config/nvim/lua/plugins.lua > ./lua/plugins.lua
else
	echo "Usage: ./config.sh install/update/repo"
fi

