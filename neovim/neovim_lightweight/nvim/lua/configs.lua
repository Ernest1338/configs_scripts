-- relative numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- incremental search
vim.o.incsearch = true

-- hide the searches
vim.o.hlsearch = false

-- smart tab + tab width to 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.expandtab = true

-- enable default tabline
vim.o.showtabline = 2

vim.cmd([[set noshowmode]])

-- better statusline
vim.cmd([[set statusline=%#CursorLine#%m%#StatusLine#%r[H4CK3D]%#CursorLine#\ %F%=\ %y\ %l/%L%=]])

-- better tabline
vim.cmd([[set tabline=%#CursorLine#%m%#StatusLine#%t%#CursorLine#\ [%n]\ ]])

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

-- set the long line highlight
vim.o.colorcolumn = "90"

-- gives one more line to work with
vim.o.cmdheight = 0 -- switching to lualine fixed the statusline disapearing problem
vim.opt.shortmess:append("c") -- might be needed for proper cmdheight

-- Set the color scheme
vim.cmd([[colorscheme myluacolors]])
-- vim.cmd([[colorscheme mycolors]])

-- auto remove trailing spaces on write
local trailing_grp = vim.api.nvim_create_augroup("TrailingSpaces", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        local original_cursor = vim.fn.getcurpos()
        local first_changed = vim.fn.getpos("'[")
        local last_changed = vim.fn.getpos("']")

        vim.cmd([[:%s/\s\+$//e]])

        vim.fn.setpos("']", last_changed)
        vim.fn.setpos("'[", first_changed)
        vim.fn.setpos('.', original_cursor)
    end,
    group = trailing_grp,
})
