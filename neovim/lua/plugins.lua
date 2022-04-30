-- file location: ~/.config/nvim/lua/plugins.lua

return require('packer').startup(function()
	-- package manager
	use 'wbthomason/packer.nvim'
	-- theme
	use 'folke/tokyonight.nvim'
	-- telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-treesitter/nvim-treesitter'
		}
	}
	-- telescope file browser addon
	use 'nvim-telescope/telescope-file-browser.nvim'
	-- telescope project management addon
	use 'nvim-telescope/telescope-project.nvim'
	-- status line
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons' }
	}
	-- completition framework
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lsp',
			'L3MON4D3/LuaSnip', 'hrsh7th/cmp-path',
		}
	} 
	-- magit but its nvim
	use 'TimUntersberger/neogit'
	-- git decorations
	use 'lewis6991/gitsigns.nvim'
	-- org in nvim
	use 'nvim-orgmode/orgmode'
	-- auto brackets
	use 'windwp/nvim-autopairs'
	-- file explorer / file tree
	use 'kyazdani42/nvim-tree.lua'
	-- lsp configs
	use 'neovim/nvim-lspconfig'
	-- lsp installer
	use 'williamboman/nvim-lsp-installer'
	-- highlight TODO, ...
	use 'folke/todo-comments.nvim'
	-- doom emacs style key showcase
	use 'folke/which-key.nvim'
end)

