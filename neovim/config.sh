#!/bin/bash

if [ -z "$1" ]; then # if $1 is zero, display usage
	echo "Usage: ./config.sh install/update/repo"
else
	if [ $1 == "install" ] || [ $1 == "update" ]; then
		read -p "About to overwrite your current config, proceed? [y/n]: " confirm
		if [[ "$confirm" == [yY] ]]; then
			echo "Git pull:" &&
			git pull &&
			echo "Installing fresh configs..." &&
			mkdir -p ~/.config/nvim/lua/ &&
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
		echo "Usage: ./config.sh install/update/repo"
	fi
fi

