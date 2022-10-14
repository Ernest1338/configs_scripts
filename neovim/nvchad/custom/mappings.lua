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
        ["<leader>:"] = { "<cmd> Telescope commands <CR>", "commands" },
        ["<leader>pp"] = { "<cmd> Telescope project <CR>", "project menu" },
        ["<leader>pe"] = { "<cmd> edit ~/.local/share/nvim/telescope-projects.txt <CR>", "edit the projects list file" },
        ["<leader>gg"] = { function() require('neogit').open() end, "neogit menu" },
        ["<leader>lf"] = { function() vim.lsp.buf.format({ async = true, timeout = 2000 }) end, "LSP format buffer" },
        ["<leader>la"] = { function() vim.lsp.buf.code_action() end, "LSP code actions" },
        ["<leader>ld"] = { "<cmd> Telescope diagnostics <CR>", "LSP diagnostics" },
        ["<leader>ls"] = { "<cmd> Telescope lsp_dynamic_workspace_symbols <CR>", "LSP symbols" },
        ["<leader>sh"] = { "<cmd> split <CR>", "split horizontal" },
        ["<leader>sv"] = { "<cmd> vsplit <CR>", "split vertical" },
        ["<leader>wd"] = { "<cmd> q <CR>", "delete window" },
        ["<leader>bb"] = { "<cmd> Telescope buffers <CR>", "switch buffer" },
        ["<leader>bd"] = { "<cmd> bdelete <CR>", "delete buffer" },
        ["<leader>bc"] = { "<cmd> enew <CR>", "create buffer" },
        ["<leader>t<leader>"] = { "<cmd> Telescope <CR>", "telescope" },
        ["n"] = { "nzzzv", "center search" },
        ["<f2>"] = { "<cmd> Telescope keymaps <CR>", "show keymaps" },
        ["K"] = {
            function()
                local line_diagnostics = vim.lsp.diagnostic.get_line_diagnostics()
                if vim.tbl_isempty(line_diagnostics) then
                    vim.lsp.buf.hover()
                else
                    vim.diagnostic.open_float()
                end
            end,
            "LSP general mapping"
        },
        ["gd"] = { function() vim.lsp.buf.definition() end, "go to definition" },
        ["gD"] = { "<cmd> Telescope lsp_references <CR>", "go to references" },
        ["<leader>;f"] = { function() vim.o.guifont = 'Hack:h24' end, "big font mode" }, -- TODO: a way to switch back
    },
    i = {
        ["<C-backspace>"] = { "<esc>bcw", opts = { nowait = true } },
    },
}

return M
