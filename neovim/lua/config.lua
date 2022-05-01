-- file location: ~/.config/nvim/config.lua

-- CONFIGS

-- show numbers
vim.o.number = true
vim.o.relativenumber = true

-- incremental search
vim.o.incsearch = true

-- hide the searches
vim.o.hlsearch = false

-- smart tab + tab width to 4
vim.o.shiftwidth = 4
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.softtabstop = 4
vim.o.tabstop = 4

-- hightlight current line
vim.o.cursorline = true

-- scroll when the cursor is 4 line from the bottom
vim.o.scrolloff = 4

-- enable mouse support
vim.o.mouse = 'a'

-- set the long line highlight
vim.o.colorcolumn = '90'

-- set the colorscheme
vim.o.termguicolors = true
vim.g.tokyonight_style = 'night'
vim.cmd('colorscheme tokyonight')

