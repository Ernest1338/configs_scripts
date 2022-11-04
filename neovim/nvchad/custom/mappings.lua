local M = {}

M.general = {
    n = {
        [";"] = { ":", "command mode", opts = { nowait = true } },
        ["<leader>fs"] = { "<cmd> w <CR>", "save file" },
        ["<leader><leader>"] = { "<cmd> Telescope find_files <CR>", "find files" },
        ["<leader>qq"] = { "<cmd> q <CR>", "quit" },
        ["<leader>qQ"] = { "<cmd> q! <CR>", "force quit" },
        ["<leader>/"] = { "<cmd> Telescope live_grep <CR>", "search" },
        ["<leader>?"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "current file search" },
        ["<leader>fd"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "current file search" },
        ["<leader>fc"] = { "<cmd> Telescope find_files cwd=~/.config/nvim/lua/custom/ <CR>", "edit configs" },
        ["<leader>ft"] = { "<cmd> Telescope filetypes <CR>", "change file type" },
        ["<leader>fi"] = { "1<C-g>", "file info (path)" },
        ["<leader>fr"] = { "<cmd> Telescope oldfiles <CR>", "recent files" },
        ["<leader>fR"] = { "<cmd> edit! <CR>", "reload file" },
        ["<leader>of"] = { "<cmd> Telescope file_browser cwd=~ <CR>", "open file" },
        ["<leader>oF"] = { "<cmd> Telescope file_browser cwd=/ <CR>", "open file from root dir" },
        ["<leader>:"] = { "<cmd> Telescope commands <CR>", "commands" },
        ["<leader>pp"] = { "<cmd> Telescope project display_type=full <CR>", "project menu" },
        ["<leader>pe"] = { "<cmd> edit ~/.local/share/nvim/telescope-projects.txt <CR>", "edit the projects list file" },
        ["<leader>gg"] = { "<cmd> lua require('neogit').open() <CR>", "neogit menu" },
        ["<leader>lf"] = { "<cmd> lua vim.lsp.buf.format({ async = true, timeout = 2000 }) <CR>", "LSP format buffer" },
        ["<leader>la"] = { "<cmd> lua vim.lsp.buf.code_action() <CR>", "LSP code actions" },
        ["<leader>ld"] = { "<cmd> Telescope diagnostics <CR>", "LSP diagnostics" },
        ["<leader>ls"] = { "<cmd> Telescope lsp_dynamic_workspace_symbols <CR>", "LSP symbols" },
        ["<leader>lr"] = { "<cmd> lua vim.lsp.buf.rename() <CR>", "LSP rename" },
        ["<leader>sh"] = { "<cmd> split <CR>", "split horizontal" },
        ["<leader>sv"] = { "<cmd> vsplit <CR>", "split vertical" },
        ["<leader>wd"] = { "<cmd> q <CR>", "delete window" },
        ["<leader>bb"] = { "<cmd> Telescope buffers <CR>", "switch buffer" },
        ["<leader>bd"] = { "<cmd> bdelete <CR>", "delete buffer" },
        ["<leader>bc"] = { "<cmd> enew <CR>", "create buffer" },
        ["<leader>t<leader>"] = { "<cmd> Telescope <CR>", "telescope" },
        ["<leader>tb"] = { function()
            if vim.o.showtabline ~= 0 then
                vim.o.showtabline = 0
            else
                vim.o.showtabline = 2
            end
        end, "toggle tab bar" },
        ["n"] = { "nzzzv", "center search" },
        ["<f2>"] = { "<cmd> Telescope keymaps <CR>", "show keymaps" },
        ["K"] = { function()
            local line_diagnostics = vim.lsp.diagnostic.get_line_diagnostics()
            if vim.tbl_isempty(line_diagnostics) then
                vim.lsp.buf.hover()
            else
                vim.diagnostic.open_float()
            end
        end, "LSP general mapping" },
        ["gd"] = { "<cmd> lua vim.lsp.buf.definition() <CR>", "go to definition" },
        ["gD"] = { "<cmd> Telescope lsp_references <CR>", "go to references" },
        ["g["] = { "<cmd> lua vim.diagnostic.goto_prev() <CR>", "go to previous LSP diagnostic" },
        ["g]"] = { "<cmd> lua vim.diagnostic.goto_next() <CR>", "go to next LSP diagnostic" },
        ["<leader>;f"] = { function()
            if vim.o.guifont == 'Hack:h20' then
                vim.o.guifont = 'Hack:h32'
            elseif vim.o.guifont == 'Hack:h32' then
                vim.o.guifont = ''
            else
                vim.o.guifont = 'Hack:h20'
            end
        end, "big font mode" },
    },
    i = {
        ["<C-backspace>"] = { "<C-w>", opts = { nowait = true } },
    },
}

return M
