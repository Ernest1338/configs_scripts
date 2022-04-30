-- file location: ~/.config/nvim/lua/keybindings.lua

-- remap space as leader key
--vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- which key bindings
local wk = require('which-key')
wk.register({
	['<leader>'] = {
		['<leader>'] = { "<cmd>Telescope find_files<cr>", "Find File" },
		f = {
			name = "File",
			f = { "<cmd>Telescope find_files<cr>", "Find File" },
			n = { "<cmd>enew<cr>", "New File" },
			s = { "<cmd>w<cr>", "Save file" },
			['/'] = { "<cmd>Telescope live_grep<cr>", "Find" },
		},
		q = {
			name = "Quit",
			q = { "<cmd>q<cr>", "Are you sure?" },
		},
		g = {
			name = "Git",
			g = { "<cmd>Neogit<cr>", "Neogit" },
		}
	},
})

