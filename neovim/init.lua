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

-- set the long line highlight
vim.o.colorcolumn = '90'

-- remap space as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- PLUGINS CONFIG SECTION

-- load the packer plugins file
require('plugins')

-- set the colorscheme now that the theme plugin is loaded
vim.o.termguicolors = true
vim.g.tokyonight_style = 'night'
vim.cmd('colorscheme tokyonight')

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

-- settings up the completition framework
local cmp = require('cmp')
cmp.setup{
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	sources = {
        {name = 'buffer',option = {keyword_length = 1}}, {name = 'nvim_lsp'}, {name = 'luasnip'}, {name = 'path'},
    },
	mapping = cmp.mapping.preset.insert({
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<Tab>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true
		}),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true
		}),
    }),
}

-- LSP settings
-- Rust
require('lspconfig').rust_analyzer.setup{}

