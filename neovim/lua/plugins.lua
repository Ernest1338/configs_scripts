-- file location: ~/.config/nvim/lua/plugins.lua

return require('packer').startup(function()
	-- package manager
	use 'wbthomason/packer.nvim'
	-- theme
	use 'folke/tokyonight.nvim'
	-- telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim',
		-- treesitter
			'nvim-treesitter/nvim-treesitter'} }
	}
	-- status line
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
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
	-- auto brackets
	use 'windwp/nvim-autopairs'
	-- file explorer / file tree
	use 'kyazdani42/nvim-tree.lua'
	-- lsp configs
	use 'neovim/nvim-lspconfig'
end)

