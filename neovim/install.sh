#!/usr/bin/env bash

echo_help () {
    echo "Provide proper name of the config you wish to install, available ones:
    - astronvim
    - lunarvim
    - neovim
    - neovimv2
    - neovimv3
    - nvchad
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
        || "$1" = "neovimv3"
        || "$1" = "neovim_lightweight"
        || "$1" = "lazyvim" ]]; then
        if [ -L "$HOME/.config/nvim" ]; then
            rm -rf ~/.config/nvim
        fi
        ln -s ~/Repos/configs_scripts/neovim/$1 ~/.config/nvim &&
        echo "Config installed successfully"
    elif [[ "$1" = "nvchad" ]]; then
        echo "Warning: will remove ~/.local/share/nvim which can contain sensitive data, Ctrl+c to cancel." &&
        read &&
        rm -rf ~/.local/share/nvim ;
        rm -rf ~/.config/nvim ;
        git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 &&
        ln -s ~/Repos/configs_scripts/neovim/nvchad ~/.config/nvim/lua/custom
    else
        echo_help
    fi
fi

