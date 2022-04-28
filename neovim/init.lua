-- file location: ~/.config/nvim/init.lua

-- show numbers
vim.o.number = true
vim.o.relativenumber = true

-- enable syntax highlighting
vim.o.syntax = 'on'

-- incremental search
vim.o.incsearch = true

-- smart tab + tab width to 4
vim.o.shiftwidth = 4
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.softtabstop = 4
vim.o.tabstop = 4

-- hightlight current line
vim.o.cursorline = true

-- enable mouse support
vim.o.mouse = 'a'

-- set colorscheme
vim.o.termguicolors = true
vim.g.tokyonight_style = 'night'
vim.cmd('colorscheme tokyonight')

-- set the long line highlight
vim.o.colorcolumn = '90'

-- remap space as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- PLUGINS SECTION

-- load the packer plugins file
require('plugins')

-- setting up the lualine plugin
require('lualine').setup {
  options = {
	  theme = 'tokyonight'
  }
}

-- setting up the auto brackets plugin
require('nvim-autopairs').setup{}

-- setting up the "magit" plugin
require('neogit').setup{}

-- setting up the file tree plugin
require('nvim-tree').setup{}

