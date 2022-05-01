#!/bin/bash

if [ $1 == "install" ] || [ $1 == "update" ]; then
	echo "Installing fresh configs..." &&
	git pull &&
	mkdir -p ~/.config/nvim/lua/ &&
	cat ./init.lua > ~/.config/nvim/init.lua &&
	cat ./lua/config.lua > ~/.config/nvim/lua/config.lua &&
	cat ./lua/keybindings.lua > ~/.config/nvim/lua/keybindings.lua &&
	cat ./lua/plugins.lua > ~/.config/nvim/lua/plugins.lua
elif [ $1 == "repo" ]; then
	echo "Updating repo with the local configs..." &&
	cat ~/.config/nvim/init.lua > ./init.lua &&
	cat ~/.config/nvim/lua/config.lua > ./lua/config.lua &&
	cat ~/.config/nvim/lua/keybindings.lua > ./lua/keybindings.lua &&
	cat ~/.config/nvim/lua/plugins.lua > ./lua/plugins.lua
fi

