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
		cat ./lua/configs.lua > $HOME/.config/nvim/lua/configs.lua &&
		cat ./lua/mappings.lua > $HOME/.config/nvim/lua/mappings.lua &&
		cat ./lua/plugins.lua > $HOME/.config/nvim/lua/plugins.lua &&
		cat ./lua/snippets.lua > $HOME/.config/nvim/lua/snippets.lua &&
		echo "Done"
	else
		echo "Aborting..."
	fi
elif [ $1 == "repo" ]; then
	echo "Updating repo with the local configs..." &&
	cat $HOME/.config/nvim/init.lua > ./init.lua &&
	cat $HOME/.config/nvim/lua/configs.lua > ./lua/configs.lua &&
	cat $HOME/.config/nvim/lua/mappings.lua > ./lua/mappings.lua &&
	cat $HOME/.config/nvim/lua/plugins.lua > ./lua/plugins.lua
	cat $HOME/.config/nvim/lua/snippets.lua > ./lua/snippets.lua
else
	echo "Usage: ./config.sh install/update/repo"
fi

