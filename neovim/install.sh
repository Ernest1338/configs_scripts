#!/bin/bash

echo_help () {
    echo "Provide proper name of the config you wish to install, available ones:
    - astronvim
    - lunarvim
    - neovim
    - neovimv2
    - neovim_lightweight
    - lazyvim"
}

if [ "$#" -eq 0 ]; then
    echo_help
else
    if [[ "$1" = "astronvim"
        || "$1" = "lunarvim"
        || "$1" = "neovim"
        || "$1" = "neovimv2"
        || "$1" = "neovim_lightweight"
        || "$1" = "lazyvim" ]]; then
        if [ -L "$HOME/.config/nvim" ]; then
            rm ~/.config/nvim
        fi
        ln -s ~/Repos/configs_scripts/neovim/$1 ~/.config/nvim &&
        echo "Config installed successfully"
    else
        echo_help
    fi
fi

