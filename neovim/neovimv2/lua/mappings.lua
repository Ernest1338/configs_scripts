local map = vim.keymap.set

-- NOTE:
-- <leader>k - special group of bindings

map({ "i", "t" }, "<C-k>", "<up>")                                                            -- <C-k> to move up
map({ "i", "t" }, "<C-j>", "<down>")                                                          -- <C-j> to move down
map({ "i", "t" }, "<C-h>", "<left>")                                                          -- <C-h> to move left
map({ "i", "t" }, "<C-l>", "<right>")                                                         -- <C-l> to move right
map("n", "<leader>;", "<cmd> Telescope live_grep <CR>")                                       -- Search project
map("n", "<leader>fs", "<cmd>w<CR>")                                                          -- Save file
map("n", "<leader><leader>", "<cmd> Telescope find_files <CR>")                               -- Find files
map("n", "<leader>qq", "<cmd> q <CR>")                                                        -- Quit
map("n", "<leader>qQ", "<cmd> q! <CR>")                                                       -- Force quit
map("n", "<leader>?", "<cmd> Telescope current_buffer_fuzzy_find <CR>")                       -- Search current file
map("n", "<leader>fc", "<cmd> Telescope find_files cwd=~/.config/nvim/ <CR>")                 -- Modify config
map("n", "<leader>fd", "<cmd> Telescope current_buffer_fuzzy_find <CR>")                      -- Search current file
map("n", "<leader>ft", "<cmd> Telescope filetypes <CR>")                                      -- Change file type
map("n", "<leader>fi", "1<C-g>")                                                              -- File info
map("n", "<leader>fr", "<cmd> Telescope oldfiles <CR>")                                       -- Recent files
map("n", "<leader>fR", "<cmd> edit! <CR>")                                                    -- Reload file
map("n", "<leader>of", "<cmd> lua MiniFiles.open('~') <CR>")                                  -- Open file
map("n", "<leader>:", "<cmd> Telescope commands <CR>")                                        -- Telescope commands
map("n", "<leader>pp", "<cmd> Telescope project display_type=full <CR>")                      -- Projects
map("n", "<leader>pe", "<cmd> edit ~/.local/share/nvim/telescope-projects.txt <CR>")          -- Edit projects file
map("n", "<leader>lf", "<cmd> lua vim.lsp.buf.format({ async = true, timeout = 2000 }) <CR>") -- Format file
map("n", "<leader>la", "<cmd> lua vim.lsp.buf.code_action() <CR>")                            -- LSP Code actions
map("n", "<leader>ld", "<cmd> Telescope diagnostics <CR>")                                    -- LSP Diagnostics
map("n", "<leader>ls", "<cmd> Telescope lsp_dynamic_workspace_symbols <CR>")                  -- LSP Symbols
map("n", "<leader>lr", "<cmd> lua vim.lsp.buf.rename() <CR>")                                 -- Rename
map("n", "<leader>sh", "<cmd> split <CR>")                                                    -- Horizontal split
map("n", "<leader>sv", "<cmd> vsplit <CR>")                                                   -- Vertical split
map("n", "<leader>wd", "<cmd> close <CR>")                                                    -- Window close
map("n", "<leader>bb", "<cmd> Telescope buffers <CR>")                                        -- Buffers
map("n", "<leader>bd", "<cmd> bdelete <CR>")                                                  -- Delete buffer
-- map("n", "<leader>bc", "<cmd> enew <CR>")                                                                -- Create buffer
-- map("n", "<leader>bn", "<cmd> bnext <CR>")                                                               -- Next buffer
-- map("n", "<leader>bp", "<cmd> bprev <CR>")                                                               -- Previous buffer
map("n", "<leader>nn", "<cmd> Telescope find_files cwd=~/Repos/notes/ <CR><cmd> cd ~/Repos/notes/ <CR>") -- Browse notes
-- map("n", "<leader>nn", "<cmd> lua MiniFiles.open('~/Repos/notes/') <CR><cmd> cd ~/Repos/notes/ <CR>") -- Browse notes
map("n", "<leader>nc", function()
    local notes_dir = "~/Repos/notes/oneTimeNotes/Others/"
    local note = vim.fn.input("Note file name (.md added automatically): ") .. ".md"
    if note ~= ".md" then
        vim.cmd("edit " .. notes_dir .. note)           -- open file in a new buf
        vim.api.nvim_set_current_dir(notes_dir)         -- change CWD to notes
    end
end)                                                    -- Create new note (one time notes directory) and open it
map("n", "<leader>t<leader>", "<cmd> Telescope <CR>")   -- Telescope
map("n", "<leader>tj", "<cmd> Telescope jumplist <CR>") -- Jumplist
-- map("n", "<leader>tr", "<cmd> lua MiniFiles.open() <CR>") -- Toggle file tree
map("n", "<C-f>", function()
    if not MiniFiles.close() then MiniFiles.open() end
end) -- Toggle file tree
map("n", "<leader>tb", function()
    if vim.o.showtabline ~= 0 then
        vim.o.showtabline = 0
    else
        vim.o.showtabline = 2
    end
end)                                                                    -- Show / hide tab bar
map("n", "<leader>td", "<cmd> lua vim.api.nvim_buf_delete(0, {}) <CR>") -- Delete current tab
map("n", "<f2>", "<cmd> Telescope keymaps <CR>")                        -- Show keymaps
map("n", "K", function()
    local line_diagnostics = vim.lsp.diagnostic.get_line_diagnostics()
    if vim.tbl_isempty(line_diagnostics) then
        vim.lsp.buf.hover()
    else
        vim.diagnostic.open_float()
    end
end)                                                        -- LSP button
map("n", "<C-k>", "<cmd> lua vim.lsp.buf.hover() <CR>")     -- LSP show hover information
map("n", "gd", "<cmd> Telescope lsp_definitions <CR>")      -- Go to deifinition
map("n", "gD", "<cmd> Telescope lsp_references <CR>")       -- Go to references
map("n", "g]", "<cmd> Gitsigns next_hunk <CR>")             -- Go to next git hunk
map("n", "g[", "<cmd> Gitsigns prev_hunk <CR>")             -- Go to previous git hunk
map("n", "g}", "<cmd> lua vim.diagnostic.goto_next() <CR>") -- Go to next diagnostic
map("n", "g{", "<cmd> lua vim.diagnostic.goto_prev() <CR>") -- Go to previous diagnostic
-- map("n", "<leader>kF", function()
--     if vim.o.guifont == 'Hack:h20' then
--         vim.o.guifont = 'Hack:h32'
--     elseif vim.o.guifont == 'Hack:h32' then
--         vim.o.guifont = ''
--     else
--         vim.o.guifont = 'Hack:h20'
--     end
-- end)                                      -- Big font mode (using TUI not GUI now)
-- map("n", "<C-I>", "<C-I>")                -- TODO: make jumplist work in alacritty (this doesnt fix it)
-- map("i", "<C-h>", "<C-w>", { nowait = true }) -- Ctrl+Backspace to remove last word (problem: overwrites movement in the insert mode)
map("n", "<tab>", "<cmd> bnext <CR>")          -- Next buffer
map("n", "<S-tab>", "<cmd> bprev <CR>")        -- Previous buffer
map("n", "<leader>ll", "<cmd> Lazy <CR>")      -- Lazy package manager
map("v", "Y", "\"+y<Esc>")                     -- Y To copy to system clipboard
-- map({ "n", "i" }, "<C-p>", "\"+p")        -- Paste from the system clipboard (doesnt work in insert mode atm)
map({ "n", "v" }, "<C-d>", "<C-d>zz")          -- Center C-d
map({ "n", "v" }, "<C-u>", "<C-u>zz")          -- Center C-u
map("n", "n", "nzzzv")                         -- Center search
map("n", "N", "Nzzzv")                         -- center backwards search
map("v", "y", "ygv<esc>")                      -- Prevent cursor jump when copying
-- map("n", ";", "<cmd> lua require('telescope.builtin').resume() <CR>") -- Resume telescope
map("n", ";", ":")                             -- Quick command
map("v", "K", ":m '<-2<CR>gv==jgvo<esc>=jgvo") -- Move highlighted text up
map("v", "J", ":m '>+1<CR>gv==kgvo<esc>=kgvo") -- Move highlighted text down

-- terminal mappings
map({ "n", "t" }, "<A-i>", "<cmd> lua require('termplug').toggle() <CR>")
map("t", "<A-Esc>", "<C-\\><C-n>") -- Terminal enter normal mode
map("t", "<A-k>", "<Up><Cr>")      -- Alt+k to repeat previous command

-- lazygit mappings
map("n", "<leader>gg", "<cmd> lua require('termplug').toggle('lazygit') <CR>")
map({ "n", "t" }, "<C-g>", "<cmd> lua require('termplug').toggle('lazygit') <CR>")

-- mini.completion mappings
-- vim.api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { noremap = true, expr = true })
-- vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })
