# Setting up neovim
- install neovim, git, gcc
- get the bashrc
- install this config using `./config.sh install`
- install packer.nvim with git
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim-lua
```
- comment impatient line from `$HOME/.config/nvim/init.lua`
- launch nvim, ignore errors and execute `:PackerInstall`
- uncomment impatient line from the same file
- install treesitter languages with: `:TSInstall <language(s)>` (rust, lua, markdown, cpp, bash, ...)
- install LSP servers with: `:LspInstall <server_name>` (rust_analyzer, ...)
- (or use just `:LspInstall` for automatic server installation)

# Other notes
- nvim plugins `https://neovimcraft.com/`
- cool setup to be inspired by `https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua`
- fast statusline `https://github.com/nvim-lualine/lualine.nvim`
- doom emacs but nvim `https://github.com/NTBBloodbath/doom-nvim`
- org mode in nvim `https://github.com/nvim-neorg/neorg`
	`https://github.com/nvim-orgmode/orgmode`
- auto completition `https://github.com/hrsh7th/nvim-cmp`
- magit but nvim `https://github.com/TimUntersberger/neogit`
- cool color theme `https://github.com/folke/tokyonight.nvim`
- telescope `https://github.com/nvim-telescope/telescope.nvim`
- auto brackets `https://github.com/windwp/nvim-autopairs`
- lightweight lsp plugin with performant ui `https://github.com/glepnir/lspsaga.nvim`
- orgmode has a bug with folds, workaround - `zx`
- the project file edit shortcut is a workaround for a missing feature in telescope-project
- play around with packer's lazy loading functionality
- think of using NvChad (alt config) `https://github.com/NvChad/NvChad`
- features missing:
	- workspaces, (tab) switching - will be implemented in telescope-project

