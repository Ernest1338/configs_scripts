-- file location: ~/.config/nvim/init.lua

-- show numbers
vim.o.number = true
vim.o.relativenumber = true

-- enable syntax highlighting
vim.o.syntax = "on"

-- incremental search
vim.o.incsearch = true

-- set highlight on search
vim.o.hlsearch = false

-- smart tab + tab width to 4
vim.o.shiftwidth = 4
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.softtabstop = 4
vim.o.tabstop = 4

-- enable mouse mode
vim.o.mouse = 'a'

-- set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme desert]]

-- remap space as leader key
--[[
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
--]]

-- load the packer plugins file
require('plugins')

