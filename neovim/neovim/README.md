# Setting up neovim
- install neovim, git, gcc
- get the bashrc
- install this config using `./config.sh install`
- install packer.nvim with git
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim-lua
```
- install plugins by executing: `nvim -u ~/.config/nvim/lua/plugins.lua +PackerSync`
- restart nvim and install treesitter languages with: `:TSInstall <language(s)>` (rust, lua, markdown, cpp, bash, ...)

(optional - if nvim-lsp-installer installed, TODO: update to using mason.nvim)
- install LSP servers with: `:LspInstall <server_name>` (rust_analyzer, ...)
- (or use just `:LspInstall` for automatic server installation)
