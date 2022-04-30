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
			t = { "<cmd>Telescope filetypes<cr>", "File type" },
			n = { "<cmd>enew<cr>", "New File" },
			s = { "<cmd>w<cr>", "Save file" },
			q = { "<cmd>wq<cr>", "Save and quit" },
			Q = { "<cmd>wq!<cr>", "Force save and quit" },
			c = { "<cmd>Telescope find_files cwd=~/.config/nvim/<cr>", "Edit neovim configs" },
			o = { "<cmd>Telescope file_browser cwd=~<cr>", "Open file" },
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
			f = { "<cmd>Telescope file_browser<cr>", "File browser" },
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
			w = { "<C-w>w", "Cycle windows" },
		},
		b = {
			name = "Buffers",
			b = { "<cmd>Telescope buffers<cr>", "Switch buffer" },
			d = { "<cmd>bdelete<cr>", "Delete buffer" },
			n = { "<cmd>bnext<cr>", "Next buffer" },
			p = { "<cmd>bprevious<cr>", "Previous buffer" },
			c = { "<cmd>enew<cr>", "Create new buffer" },

		},
		p = {
			name = "Projects",
			-- Projects / Repos directory: ~/Programming/Repos
			p = { "<cmd>Telescope project<cr>", "Project menu" },
			e = { "<cmd>edit "..os.getenv('HOME').."/.local/share/nvim/telescope-projects.txt<cr>", "Edit the projects file" },
			['/'] = { "<cmd>Telescope live_grep<cr>", "Project search" },
		},
		o = {
			name = "Open",
			f = { "<cmd>Telescope file_browser cwd=~<cr>", "Open file" },
		},
		[';'] = {
			name = "Prefix",
		},
		['/'] = { "<cmd>Telescope live_grep<cr>", "Search" },
		['?'] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current file search" },
	},
})

