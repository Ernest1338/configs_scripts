-- file location: ~/.config/nvim/config.lua

-- CONFIGS

-- show numbers
vim.wo.number = true
vim.wo.relativenumber = true

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

-- enable break indent
vim.o.breakindent = true

-- save undo history
vim.o.undofile = true

-- case insensitive search
vim.o.ignorecase = true
vim.o.smartcase = true

-- decrease update time
vim.o.updatetime = 500

-- enable mouse support
vim.o.mouse = "a"

-- better completion experience
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- dont show matching x of x
vim.opt.shortmess:append "c"

-- dont redraw the screen when executing macros / regexes
vim.o.lazyredraw = true

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
--vim.cmd([[colorscheme monokai_pro]])
vim.cmd([[colorscheme gruvbox]])

-- clipboard shared with the system
vim.cmd([[set clipboard+=unnamedplus]])

-- prevent jumping of the screen
vim.wo.signcolumn = "yes"

-- disable unused python provider
vim.g.loaded_python3_provider = 0

-- folding support with treesitter
--vim.o.foldmethod = "expr"
--vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- gives one more line to work with
-- TODO: uncomment once v0.8 dropps
--vim.cmd([[set cmdheight=0]])
--vim.o.cmdheight = 0 -- lua version, not tested

-- neovide configs
vim.g.neovide_remember_window_size = true
vim.g.neovide_remember_window_position = true
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_refresh_rate = 75
vim.g.neovide_fullscreen = true

-- gui font
--vim.o.guifont="Hack:h12"

-- highlight yanked text
vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank()]])

-- auto format on write (lsp-format is better beacuse its async)
--vim.cmd([[autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 2000)]])

-- auto remove trailing spaces on write
--vim.cmd([[autocmd BufWritePre * :%s/\s\+$//e]])

-- highlight trailing spaces
--vim.cmd([[hi EoLSpace ctermbg=238 guibg=#802020]])
--vim.cmd([[match EoLSpace /\s\+$/]])

