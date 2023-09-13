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
map("n", "<leader>fc", ":e ~/.config/nvim/") -- Edit config files
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
map("n", "<A-i>", function()
    local buffer_number = vim.fn.bufnr("termplug")
    if buffer_number == -1 then
        vim.cmd("split term://bash | file termplug | startinsert") -- create if not exist
    else
        if vim.fn.bufnr("%") == buffer_number then
            vim.cmd("hide") -- hide if current
        else
            vim.cmd("split termplug | startinsert") -- switch to if not
        end
    end
end) -- Terminal mapping
map("t", "<A-i>", "<cmd>q<CR>") -- Terminal toggle in terminal mode
map("t", "<A-k>", "<Up><Cr>") -- Alt+k to repeat previous command
map("t", "<A-Esc>", "<C-\\><C-n>") -- Terminal enter normal mode
map("n", "<tab>", "<cmd> bnext <CR>") -- Next buffer
map({"n", "v"}, "<C-d>", "<C-d>zz") -- Center C-d
map({"n", "v"}, "<C-u>", "<C-u>zz") -- Center C-u
map("v", "<leader>/", function()
    local filetype = vim.api.nvim_buf_get_option(0, "filetype")
    local _, line_left, col_left, _ = unpack(vim.fn.getpos("v"))
    local _, line_right, col_right, _ = unpack(vim.fn.getcurpos())
    if line_left > line_right then
        local tmp = line_left
        line_left = line_right
        line_right = tmp
    end
    local comment = "//"
    if filetype == "lua" then
        comment = "--"
    elseif filetype == "vim" then
        comment = "\""
    elseif filetype == "python" then
        comment = "#"
    end
    local new_lines = {}
    for i=line_left, line_right do
        local line = vim.api.nvim_buf_get_lines(0, i - 1, i, false)[1]
        if line ~= "" then
            local whitespace = string.match(line, "^%s+") or ""
            local last = line:sub(#whitespace + 1, #line)
            local maybe_comment = last:sub(1, #comment)
            if maybe_comment == comment then
                local after_comment_index = #comment+1
                if last:sub(#comment+1, #comment+1) == " " then
                    after_comment_index = #comment+2
                end
                table.insert(new_lines, whitespace .. last:sub(after_comment_index, #last))
            else
                table.insert(new_lines, whitespace .. comment .. " " .. last)
            end
        else
            table.insert(new_lines, "")
        end
    end
    vim.api.nvim_input("<Esc>")
    vim.api.nvim_buf_set_lines(0, line_left - 1, line_right, false, new_lines)
end)

-- completion mappings
vim.api.nvim_set_keymap('i', '<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]],   { noremap = true, expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })
