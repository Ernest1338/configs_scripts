-- file location: ~/.config/nvim/lua/plugins.lua

return require('packer').startup(function()
	-- package manager
	use 'wbthomason/packer.nvim'
	-- improve startup time by caching some plugins
	use 'lewis6991/impatient.nvim'
	-- theme (potentially not necessary)
	use 'tanvirtin/monokai.nvim'
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
		requires = { -- (some potentially not necessary)
			'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lsp',
			'dcampos/nvim-snippy', 'hrsh7th/cmp-path',
			'dcampos/cmp-snippy'
		}
	} 
	-- magit but its nvim
	use 'TimUntersberger/neogit'
	-- git decorations (potentially not necessary)
	use 'lewis6991/gitsigns.nvim'
	-- org in nvim
	use 'nvim-orgmode/orgmode'
	-- auto brackets
	use 'windwp/nvim-autopairs'
	-- file explorer / file tree
	use 'kyazdani42/nvim-tree.lua'
	-- lsp configs
	use 'neovim/nvim-lspconfig'
	-- lsp installer (potentially not necessary)
	use 'williamboman/nvim-lsp-installer'
	-- highlight TODO, ... (potentially not necessary)
	use 'folke/todo-comments.nvim'
	-- doom emacs style key showcase
	use 'folke/which-key.nvim'
end)

