-- relative numbers
vim.wo.number = true
-- vim.wo.relativenumber = true

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

-- automatically change CWD (should not cause issues but does - telescope project wide search breakes)
-- vim.o.autochdir = true

-- avoid disapearing status line
vim.o.showmode = false
vim.o.showcmd = false

-- set the long line highlight
vim.o.colorcolumn = "90"

-- keep the top line when creating a split
vim.o.splitkeep = "topline"

vim.o.termguicolors = true

-- folding support with treesitter
-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- gives one more line to work with
vim.o.cmdheight = 0            -- switching to eg-statusline fixed the statusline disapearing problem
vim.opt.shortmess:append("cI") -- might be needed for proper cmdheight + don't show intro message

-- neovide configs
-- vim.g.neovide_remember_window_size = true
-- vim.g.neovide_remember_window_position = true
-- vim.g.neovide_cursor_antialiasing = true
-- vim.g.neovide_refresh_rate = 75
-- vim.g.neovide_fullscreen = true

-- gui font
--vim.o.guifont="Hack:h12"

-- Highlight on yank
local yank_grp = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
    group = yank_grp,
})

-- Auto remove trailing spaces on write
local trailing_grp = vim.api.nvim_create_augroup("TrailingSpaces", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        local original_cursor = vim.api.nvim_win_get_cursor(0)
        vim.cmd([[keeppatterns %s/\s\+$//e]])
        vim.api.nvim_win_set_cursor(0, original_cursor)
    end,
    group = trailing_grp,
})

-- NOTE: Hide the tab bar when only one buffer exists
-- vim.api.nvim_create_autocmd('BufEnter', {
--     callback = vim.schedule_wrap(function()
--         local n_listed_bufs = 0
--         for _, buf_id in ipairs(vim.api.nvim_list_bufs()) do
--             if vim.fn.buflisted(buf_id) == 1 then n_listed_bufs = n_listed_bufs + 1 end
--         end
--         vim.o.showtabline = n_listed_bufs > 1 and 2 or 0
--     end),
--     desc = 'Update tabline based on the number of listed buffers',
-- })

-- NOTE: I DONT KNOW IF THE vim.schedule IS BETTER OR WORSE HERE
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

-- highlight trailing spaces
-- vim.cmd([[hi EoLSpace ctermbg=238 guibg=#802020]])
-- vim.cmd([[match EoLSpace /\s\+$/]])

-- NOTE: playing around with creating a dashboard
-- local dashboard_grp = vim.api.nvim_create_augroup("Dashboard", { clear = true })
-- vim.api.nvim_create_autocmd("VimEnter", {
--     callback = function()
--         vim.api.nvim_buf_set_lines(0, 0, -1, false, {
--             "Hello!",
--             "This is a dashboard!"
--         })
--     end,
--     group = dashboard_grp,
-- })
-- local buf = vim.api.nvim_create_buf(false, true)
-- vim.api.nvim_buf_set_name(buf, "my_buffer_name")
-- vim.api.nvim_buf_set_lines(buf, 0, -1, true, {"Hello, world!"})
--
-- local function delete_buffer()
--   vim.api.nvim_buf_delete(buf, {force = true})
-- end
--
-- vim.cmd(string.format("autocmd BufLeave <buffer=%d> lua vim.api.nvim_buf_delete(%d, {force = true})", buf, buf))
--
-- vim.cmd(string.format("buffer %d", buf))
