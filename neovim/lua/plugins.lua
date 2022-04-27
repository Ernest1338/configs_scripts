return require('packer').startup(function()
        use 'wbthomason/packer.nvim'
        --[[use {
          'nvim-telescope/telescope.nvim',
          requires = { {'nvim-lua/plenary.nvim',
          'nvim-treesitter/nvim-treesitter'} }
        }--]]
        use {
          'nvim-telescope/telescope.nvim',
          requires = { {'nvim-lua/plenary.nvim',
          'nvim-treesitter/nvim-treesitter'} }
        }
end)

