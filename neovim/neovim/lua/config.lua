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
vim.cmd("colorscheme monokai_pro")

-- clipboard shared with the system
vim.cmd("set clipboard+=unnamedplus")

-- prevent jumping of the screen
vim.cmd("set signcolumn=yes")

-- auto format on write
--vim.cmd("autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)")

-- highlight trailing spaces
--vim.cmd([[hi EoLSpace ctermbg=238 guibg=#802020]])
--vim.cmd([[match EoLSpace /\s\+$/]])

