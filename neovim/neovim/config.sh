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
		mkdir -p $HOME/.config/nvim/colors/ &&
		echo "Installing fresh configs..." &&
		cat ./init.lua > $HOME/.config/nvim/init.lua &&
		cat ./lua/config.lua > $HOME/.config/nvim/lua/config.lua &&
		cat ./lua/mappings.lua > $HOME/.config/nvim/lua/mappings.lua &&
		cat ./lua/plugins.lua > $HOME/.config/nvim/lua/plugins.lua &&
		cat ./lua/snippets.lua > $HOME/.config/nvim/lua/snippets.lua &&
		cat ./lua/colorscheme.lua > $HOME/.config/nvim/lua/colorscheme.lua &&
		cat ./colors/monokai.lua > $HOME/.config/nvim/colors/monokai.lua &&
		echo "Done"
	else
		echo "Aborting..."
	fi
elif [ $1 == "repo" ]; then
	echo "Updating repo with the local configs..." &&
	cat $HOME/.config/nvim/init.lua > ./init.lua &&
	cat $HOME/.config/nvim/lua/config.lua > ./lua/config.lua &&
	cat $HOME/.config/nvim/lua/mappings.lua > ./lua/mappings.lua &&
	cat $HOME/.config/nvim/lua/plugins.lua > ./lua/plugins.lua
	cat $HOME/.config/nvim/lua/snippets.lua > ./lua/snippets.lua
	cat $HOME/.config/nvim/colors/monokai.lua > ./colors/monokai.lua
	cat $HOME/.config/nvim/lua/colorscheme.lua > ./lua/colorscheme.lua
else
	echo "Usage: ./config.sh install/update/repo"
fi

