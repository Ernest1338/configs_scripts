-- relative numbers
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

-- scroll when the cursor is 4 line from the bottom
vim.o.scrolloff = 4

-- hightlight current line
vim.o.cursorline = true

-- prevent jumping of the screen
vim.wo.signcolumn = "yes"

-- enable break indent
vim.o.breakindent = true

-- case insensitive search
vim.o.ignorecase = true
vim.o.smartcase = true

-- decrease update time
vim.o.updatetime = 500

-- better completion experience
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- dont redraw the screen when executing macros / regexes
vim.o.lazyredraw = true

-- save undo history to a file
vim.o.undofile = true

-- diagnostic popup
vim.diagnostic.config({
    virtual_text = true,
    --signs = false,
    float = { border = "single" },
})

-- set the long line highlight
vim.o.colorcolumn = "90"

-- keep the top line when creating a split
-- TODO: once 0.9 drops?
--vim.o.splitkeep = "topline"

-- folding support with treesitter
-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"

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

-- Set the color scheme
vim.cmd([[colorscheme gruvbox]])

-- Highlight on yank
local yank_grp = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
    group = yank_grp,
})

-- TODO: I DONT KNOW IF THE vim.schedule IS BETTER OR WORSE HERE

-- auto format on write
-- local format_grp = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     callback = function()
--         --vim.schedule(function()
--         vim.lsp.buf.format({ async = true, timeout = 2000 })
--         --end)
--     end,
--     group = format_grp,
-- })

-- auto remove trailing spaces on write
local trailing_grp = vim.api.nvim_create_augroup("TrailingSpaces", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        --vim.schedule(function()
        local original_cursor = vim.fn.getcurpos()
        local first_changed = vim.fn.getpos("'[")
        local last_changed = vim.fn.getpos("']")

        vim.cmd([[:%s/\s\+$//e]])

        vim.fn.setpos("']", last_changed)
        vim.fn.setpos("'[", first_changed)
        vim.fn.setpos('.', original_cursor)
        --end)
    end,
    group = trailing_grp,
})

-- highlight trailing spaces
-- vim.cmd([[hi EoLSpace ctermbg=238 guibg=#802020]])
-- vim.cmd([[match EoLSpace /\s\+$/]])

