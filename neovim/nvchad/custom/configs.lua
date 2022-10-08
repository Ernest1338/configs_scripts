-- relative numbers
vim.wo.relativenumber = true

-- incremental search
vim.o.incsearch = true

-- hide the searches
vim.o.hlsearch = false

-- smart tab + tab width to 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4

-- scroll when the cursor is 4 line from the bottom
vim.o.scrolloff = 4

-- enable break indent
vim.o.breakindent = true

-- better completion experience
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- dont redraw the screen when executing macros / regexes
vim.o.lazyredraw = true

-- diagnostic popup
vim.diagnostic.config({
    virtual_text = true,
    --signs = false,
    float = { border = "single" },
})

-- set the long line highlight
vim.o.colorcolumn = "90"

-- folding support with treesitter
--vim.o.foldmethod = "expr"
--vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- gives one more line to work with
vim.o.cmdheight = 0
vim.opt.shortmess:append "c" -- might be needed for proper cmdheight

-- neovide configs
vim.g.neovide_remember_window_size = true
vim.g.neovide_remember_window_position = true
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_refresh_rate = 75
vim.g.neovide_fullscreen = true

-- gui font
--vim.o.guifont="Hack:h12"

-- Highlight on yank
local yankGrp = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    command = "silent! lua vim.highlight.on_yank()",
    group = yankGrp,
})

-- auto format on write
--vim.api.nvim_create_autocmd("BufWritePre", {
--    command = "lua vim.lsp.buf.format({ async = true, timeout = 2000 })"
--})

-- auto remove trailing spaces on write
--vim.cmd([[autocmd BufWritePre * :%s/\s\+$//e]])

-- highlight trailing spaces
--vim.cmd([[hi EoLSpace ctermbg=238 guibg=#802020]])
--vim.cmd([[match EoLSpace /\s\+$/]])
