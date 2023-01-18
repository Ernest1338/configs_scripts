local map = vim.keymap.set

-- NOTES:
-- <leader>k - special group of bindings

map("i", "<C-h>", "<left>") -- <C-h> to move left
map("i", "<C-j>", "<down>") -- <C-j> to move down
map("i", "<C-k>", "<up>") -- <C-k> to move up
map("i", "<C-l>", "<right>") -- <C-l> to move right
map("n", "<leader>;", "<cmd> Telescope live_grep <CR>") -- Search project
map("n", "<leader>fs", "<cmd>w<CR>") -- Save file
map("n", "<leader><leader>", "<cmd> Telescope find_files <CR>") -- Find files
map("n", "<leader>qq", "<cmd> q <CR>") -- Quit
map("n", "<leader>qQ", "<cmd> q! <CR>") -- Force quit
map("n", "<leader>?", "<cmd> Telescope current_buffer_fuzzy_find <CR>") -- Search current file
map("n", "<leader>fc", "<cmd> Telescope find_files cwd=~/.config/nvim/ <CR>") -- Modify config
map("n", "<leader>fd", "<cmd> Telescope current_buffer_fuzzy_find <CR>") -- Search current file
map("n", "<leader>ft", "<cmd> Telescope filetypes <CR>") -- Change file type
map("n", "<leader>fi", "1<C-g>") -- File info
map("n", "<leader>fr", "<cmd> Telescope oldfiles <CR>") -- Recent files
map("n", "<leader>fR", "<cmd> edit! <CR>") -- Reload file
map("n", "<leader>of", "<cmd> Telescope file_browser cwd=~ <CR>") -- Open file
map("n", "<leader>:", "<cmd> Telescope commands <CR>") -- Telescope commands
map("n", "<leader>pp", "<cmd> Telescope project display_type=full <CR>") -- Projects
map("n", "<leader>pe", "<cmd> edit ~/.local/share/nvim/telescope-projects.txt <CR>") -- Edit projects file
map("n", "<leader>gg", "<cmd> Neogit kind=split <CR>") -- Neogit
map("n", "<leader>lf", "<cmd> lua vim.lsp.buf.format({ async = true, timeout = 2000 }) <CR>") -- Format file
map("n", "<leader>la", "<cmd> lua vim.lsp.buf.code_action() <CR>") -- LSP Code actions
map("n", "<leader>ld", "<cmd> Telescope diagnostics <CR>") -- LSP Diagnostics
map("n", "<leader>ls", "<cmd> Telescope lsp_dynamic_workspace_symbols <CR>") -- LSP Symbols
map("n", "<leader>lr", "<cmd> lua vim.lsp.buf.rename() <CR>") -- Rename
map("n", "<leader>sh", "<cmd> split <CR>") -- Horizontal split
map("n", "<leader>sv", "<cmd> vsplit <CR>") -- Vertical split
map("n", "<leader>wd", "<cmd> q <CR>") -- Window delete
map("n", "<leader>bb", "<cmd> Telescope buffers <CR>") -- Buffers
map("n", "<leader>bd", "<cmd> bdelete <CR>") -- Delete buffer
map("n", "<leader>bc", "<cmd> enew <CR>") -- Create buffer
map("n", "<leader>bn", "<cmd> bnext <CR>") -- Next buffer
map("n", "<leader>t<leader>", "<cmd> Telescope <CR>") -- Telescope
map("n", "<leader>tj", "<cmd> Telescope jumplist <CR>") -- Jumplist
map("n", "<leader>tb", function()
    if vim.o.showtabline ~= 0 then
        vim.o.showtabline = 0
    else
        vim.o.showtabline = 2
    end
end) -- Show / hide tab bar
map("n", "<f2>", "<cmd> Telescope keymaps <CR>") -- Show keymaps
map("n", "K", function()
    local line_diagnostics = vim.lsp.diagnostic.get_line_diagnostics()
    if vim.tbl_isempty(line_diagnostics) then
        vim.lsp.buf.hover()
    else
        vim.diagnostic.open_float()
    end
end) -- LSP button
map("n", "gd", "<cmd> lua vim.lsp.buf.definition() <CR>") -- Go to deifinition
map("n", "gD", "<cmd> Telescope lsp_references <CR>") -- Go to references
map("n", "g[", "<cmd> lua vim.diagnostic.goto_prev() <CR>") -- Go to next diagnostic
map("n", "g]", "<cmd> lua vim.diagnostic.goto_next() <CR>") -- Go to previous diagnostic
map("n", "<leader>kF", function()
    if vim.o.guifont == 'Hack:h20' then
        vim.o.guifont = 'Hack:h32'
    elseif vim.o.guifont == 'Hack:h32' then
        vim.o.guifont = ''
    else
        vim.o.guifont = 'Hack:h20'
    end
end) -- Big font mode
map("n", "n", "nzzzv") -- Center search
map("n", "N", "Nzzzv") -- center backwards search
map("n", "<C-I>", "<C-I>") -- makes jumplist work in neovide?
map("i", "<C-backspace>", "<C-w>", { nowait = true }) -- TODO: doesnt work in wezterm
map("n", "<A-i>", "<cmd>split term://bash<CR><cmd>startinsert<CR>") -- Terminal mapping
map("t", "<A-i>", "<cmd>q<CR>") -- Terminal toggle in terminal mode
map("n", "<tab>", "<cmd> bnext <CR>") -- Next buffer
map("n", "<leader>ll", "<cmd> Lazy <CR>") -- Lazy package manager

-- this is a workaround for neovide, the map func made it behave weirdly
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", {}) -- Center C-d in normal mode
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", {}) -- Center C-u in normal mode
vim.api.nvim_set_keymap("v", "<C-d>", "<C-d>zz", {}) -- Center C-d in visual mode
vim.api.nvim_set_keymap("v", "<C-u>", "<C-u>zz", {}) -- Center C-u in visual mode

-- completion mappings
vim.api.nvim_set_keymap('i', '<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]],   { noremap = true, expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })
