-- file location: ~/.config/nvim/init.lua

-- REQUIRE SECTION

-- load impatient and the packer plugins file
require('impatient')
require('plugins')
-- mappings file
require('mappings')
-- editor configs
require('config')

-- PLUGINS CONFIG SECTION

-- setting up the lualine plugin
require('lualine').setup{}

-- setting up treesitter
require('nvim-treesitter.configs').setup{
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	}
}

-- folding support with treesitter
--vim.o.foldmethod = "expr"
--vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- setting up the auto brackets plugin
require('nvim-autopairs').setup{}

-- setting up the "magit" plugin
require('neogit').setup{}

-- settings up the git decorations plugin
require('gitsigns').setup{}

-- setting up the file tree plugin
require('nvim-tree').setup{}

-- setting up the TODO highlight plugin
require('todo-comments').setup{}

-- setting up the org mode plugin
--require('orgmode').setup{}
--require('orgmode').setup_ts_grammar()

-- settings up the telescope and addons
require('telescope').setup{
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = require('telescope.actions').move_selection_next,
				["<C-k>"] = require('telescope.actions').move_selection_previous,
			},
		},
	},
}
require('telescope').load_extension('file_browser')
require('telescope').load_extension('project')

-- setting up the which key plugin
require('which-key').setup{
	key_labels = {
		['<space>'] = "SPC",
		['<cr>'] = "RET",
		['<tab>'] = "TAB",
	}
}
-- show which key after 500ms
vim.o.timeoutlen = 500

-- settings up the completition framework
local cmp = require('cmp')
cmp.setup{
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	sources = {
        {name = 'buffer', option = {keyword_length = 2}},
		{name = 'nvim_lsp'},
		{name = 'luasnip'},
		{name = 'path'},
	},
	mapping = cmp.mapping.preset.insert({
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-e>'] = cmp.mapping.abort(),
		['<Tab>'] = cmp.mapping.confirm({
			--behavior = cmp.ConfirmBehavior.Insert,
			select = true
		}),
		['<CR>'] = cmp.mapping.confirm({
			--behavior = cmp.ConfirmBehavior.Insert,
			select = true
		}),
    }),
}

-- LSP settings

--require('nvim-lsp-installer').setup{}

-- Rust
require('lspconfig').rust_analyzer.setup{}

