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
			c = { "<cmd>wq<cr>", "Save and quit" },
			x = { "<cmd>wq!<cr>", "Force save and quit" },
			S = { "<cmd>Telescope live_grep<cr>", "Global search" },
			['/'] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find" },
		},
		q = {
			name = "Quit",
			q = { "<cmd>q<cr>", "Quit" },
			Q = { "<cmd>q!<cr>", "Force quit" },
		},
		g = {
			name = "Git",
			g = { "<cmd>Neogit<cr>", "Neogit" },
		},
		t = {
			name = "Telescope",
			t = { "<cmd>Telescope<cr>", "Telescope" },
			T = { "<cmd>TodoTelescope<cr>", "Telescope TODO list" },
			c = { "<cmd>Telescope commands<cr>", "Commands" },
			s = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
			g = { "<cmd>Telescope git_files<cr>", "Find git files" },
		},
		T = { "<cmd>NvimTreeToggle<cr>", "Tree" },
		s = {
			name = "Split",
			v = { "<cmd>vsplit<cr>", "Vertical" },
			h = { "<cmd>split<cr>", "Horizontal" },
		},
		w = {
			name = "Window",
			c = { "<cmd>q<cr>", "Close" },
			h = { "<cmd>wincmd h<cr>", "Left window" },
			j = { "<cmd>wincmd j<cr>", "Down window" },
			k = { "<cmd>wincmd k<cr>", "Up window" },
			l = { "<cmd>wincmd l<cr>", "Right window" },
		},
	},
})

