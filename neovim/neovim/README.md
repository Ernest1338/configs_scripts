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
- creating files from nvim: go to git using telescope file_browser, normal mode: `c` to create file
- real time collaborative editing plugin - `https://github.com/jbyuki/instant.nvim`
- better folding (beta?) - `https://github.com/kevinhwang91/nvim-ufo`
- better diagnostic ui - `https://git.sr.ht/~whynothugo/lsp_lines.nvim`
- create custom submodes and menus - `https://github.com/anuvyklack/hydra.nvim`
- highlight / trim whitespaces (minimal plugin in lua) - `https://github.com/zakharykaplan/nvim-retrail`
- easily install lsp / dap servers, linters and formatters - `https://github.com/williamboman/mason.nvim`
- distraction-free editing (zen mode) - `https://github.com/Pocco81/true-zen.nvim`
- tips on improving startup / performance of lua in nvim - `https://www.reddit.com/r/neovim/comments/opipij/guide_tips_and_tricks_to_reduce_startup_and/`
- (supposedly) very good git plugin - `https://github.com/tpope/vim-fugitive`
- fzf in telescope - https://github.com/nvim-telescope/telescope-fzf-native.nvim
- features missing:
	- workspaces, (tab) switching - will be implemented in telescope-project

