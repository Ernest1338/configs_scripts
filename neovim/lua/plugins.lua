return require('packer').startup(function()
	-- package manager
	use 'wbthomason/packer.nvim'
	-- theme
	use 'folke/tokyonight.nvim'
	-- telescope
	use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim',
	  'nvim-treesitter/nvim-treesitter'} }
	}
	-- status line
	use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
    -- completition framework
	use 'hrsh7th/nvim-cmp'
    -- magit but its nvim
	use 'TimUntersberger/neogit'
    -- auto brackets
    use 'windwp/nvim-autopairs'
end)

