local map = vim.keymap.set

-- NOTES:
-- <leader>k - special group of bindings

map("i", "<C-h>", "<left>") -- <C-h> to move left
map("i", "<C-j>", "<down>") -- <C-j> to move down
map("i", "<C-k>", "<up>") -- <C-k> to move up
map("i", "<C-l>", "<right>") -- <C-l> to move right
map("n", "<leader>;", "<cmd> !rg TODO <CR>") -- Search project
map("n", "<leader>fs", "<cmd>w<CR>") -- Save file
map("n", "<leader><leader>", ":e ") -- Find files
map("n", "<leader>qq", "<cmd> q <CR>") -- Quit
map("n", "<leader>qQ", "<cmd> q! <CR>") -- Force quit
map("n", "<leader>fd", "<cmd> lua print('TODO') <CR>") -- Search current file
map("n", "<leader>fi", "1<C-g>") -- File info
map("n", "<leader>fR", "<cmd> edit! <CR>") -- Reload file
map("n", "<leader>pp", "<cmd> lua print('TODO') <CR>") -- Projects
map("n", "<leader>sh", "<cmd> split <CR>") -- Horizontal split
map("n", "<leader>sv", "<cmd> vsplit <CR>") -- Vertical split
map("n", "<leader>wd", "<cmd> q <CR>") -- Window delete
map("n", "<leader>bb", "<cmd> buffers <CR>") -- Buffers
map("n", "<leader>bd", "<cmd> bdelete <CR>") -- Delete buffer
map("n", "<leader>bc", "<cmd> enew <CR>") -- Create buffer
map("n", "<leader>bn", "<cmd> bnext <CR>") -- Next buffer
map("n", "<leader>tb", function()
    if vim.o.showtabline ~= 0 then
        vim.o.showtabline = 0
    else
        vim.o.showtabline = 2
    end
end) -- Show / hide tab bar
map("n", "n", "nzzzv") -- Center search
map("n", "N", "Nzzzv") -- center backwards search
map("n", "<A-i>", "<cmd>split term://bash<CR><cmd>startinsert<CR>") -- Terminal mapping
map("t", "<A-i>", "<cmd>q<CR>") -- Terminal toggle in terminal mode
map("n", "<tab>", "<cmd> bnext <CR>") -- Next buffer
map({"n", "v"}, "<C-d>", "<C-d>zz") -- Center C-d
map({"n", "v"}, "<C-u>", "<C-u>zz") -- Center C-u

-- completion mappings
vim.api.nvim_set_keymap('i', '<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]],   { noremap = true, expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })
