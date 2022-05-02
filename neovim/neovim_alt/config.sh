#!/bin/bash

if [ -z "$1" ]; then # if $1 is zero, display usage
    echo "Usage: ./config.sh install/update/repo" && exit 1
fi
if [ $1 == "install" ]; then
    read -p "About to overwrite your current config, proceed? [y/n]: " confirm
    if [[ "$confirm" == [yY] ]]; then
        echo "Git pull:" &&
        git pull &&
        mkdir -p $HOME/.config/nvim/ &&
        echo "Installing configs..." &&
        git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 &&
        nvim +'hi NormalFloat guibg=#1e222a' +PackerSync &&
        cp -r ./custom/ ~/.config/nvim/lua/ &&
        echo "Done"
    else
        echo "Aborting..."
    fi
elif [ $1 == "update" ]; then
    read -p "About to overwrite your current config, proceed? [y/n]: " confirm
    if [[ "$confirm" == [yY] ]]; then
        echo "Git pull(s):" &&
        git pull &&
        cd ~/.config/nvim/ &&
        git pull &&
        cd $OLDPWD &&
        echo "Updating configs..." &&
        rm -rf ~/.config/nvim/custom &&
        cp -r ./custom ~/.config/nvim/lua/ &&
        echo "Done"
    else
        echo "Aborting..."
    fi
elif [ $1 == "repo" ]; then
    echo "Updating repo with the local configs..." &&
    echo "Done"
else
    echo "Usage: ./config.sh install/update/repo"
fi

