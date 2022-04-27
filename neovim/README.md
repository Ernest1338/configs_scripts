# Setting up neovim
- install neovim, git
- get the bashrc
- put everything from this dir to ~/.config/nvim
  and the global config to /etc/xdg/nvim
- install packer.nvim with git
  ```bash
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
  ```
- execute ```:PackerInstall```
