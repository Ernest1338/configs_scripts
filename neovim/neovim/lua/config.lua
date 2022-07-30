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
vim.o.expandtab = true

-- hightlight current line
vim.o.cursorline = true

-- scroll when the cursor is 4 line from the bottom
vim.o.scrolloff = 4

-- enable mouse support
vim.o.mouse = "a"

-- diagnostic popup
vim.diagnostic.config({
    virtual_text = true,
    --signs = false,
    float = { border = "single" },
})

-- show which key after 500ms
vim.o.timeoutlen = 500

-- set the long line highlight
vim.o.colorcolumn = "90"

-- set the colorscheme
vim.o.termguicolors = true
--vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
--vim.cmd[[colorscheme catppuccin]]
vim.cmd([[colorscheme monokai_pro]])

-- clipboard shared with the system
vim.cmd([[set clipboard+=unnamedplus]])

-- prevent jumping of the screen
vim.cmd([[set signcolumn=yes]])

-- gives one more line to work with
-- TODO: uncomment once v0.8 dropps
--vim.cmd([[set cmdheight=0]])

-- neovide configs
vim.g.neovide_remember_window_size = true
vim.g.neovide_remember_window_position = true
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_refresh_rate = 75
vim.g.neovide_fullscreen = true

-- auto format on write
--vim.cmd([[autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)]])

-- auto remove trailing spaces on write
--vim.cmd([[autocmd BufWritePre * :%s/\s\+$//e]])

-- highlight trailing spaces
--vim.cmd([[hi EoLSpace ctermbg=238 guibg=#802020]])
--vim.cmd([[match EoLSpace /\s\+$/]])

