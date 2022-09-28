local M = {}

M.general = {
    n = {
        [";"] = { ":", "command mode", opts = { nowait = true } },
        ["<leader>fs"] = { "<cmd> w <CR>", "save file" },
        ["<leader><leader>"] = { "<cmd> Telescope find_files <CR>", "find files" },
        ["<leader>qq"] = { "<cmd> q <CR>", "quit" },
        ["<leader>qQ"] = { "<cmd> q! <CR>", "force quit" },
        ["<leader>/"] = { function() require("telescope.builtin").live_grep() end, "search" },
        ["<leader>?"] = { function() require("telescope.builtin").current_buffer_fuzzy_find() end, "current file search" },
        ["<leader>fd"] = { function() require("telescope.builtin").current_buffer_fuzzy_find() end, "current file search" },
        ["<leader>fc"] = { "<cmd> Telescope find_files cwd=~/.config/nvim/lua/custom/ <CR>", "edit configs" },
        ["<leader>ft"] = { function() require("telescope.builtin").filetypes() end, "change file type" },
        ["<leader>fi"] = { "1<C-g>", "file info (path)" },
        ["<leader>fr"] = { function() require("telescope.builtin").oldfiles() end, "recent files" },
        ["<leader>fR"] = { "<cmd> edit! <CR>", "reload file" },
        ["<leader>of"] = { "<cmd> Telescope file_browser cwd=~ <CR>", "open file" },
        ["<leader>:"] = { function() require("telescope.builtin").commands() end, "commands" },
        ["<leader>pp"] = { function() require("telescope.builtin").project() end, "project menu" },
        ["<leader>pe"] = { "<cmd> edit ~/.local/share/nvim/telescope-projects.txt <CR>", "edit the projects list file" },
        ["<leader>gg"] = { function() require('neogit').open() end, "neogit menu" },
        ["<leader>lf"] = { function() vim.lsp.buf.formatting_sync(nil, 2000) end, "LSP format buffer" },
        -- once 0.8 drops
        --["<leader>lf"] = { function() vim.lsp.buf.format({timeout_ms=2000}) end, "LSP format buffer" },
        ["<leader>la"] = { function() vim.lsp.buf.code_action() end, "LSP code actions" },
        ["<leader>ld"] = { function() require("telescope.builtin").diagnostics() end, "LSP diagnostics" },
        ["<leader>ls"] = { function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, "LSP symbols" },
        ["<leader>sh"] = { "<cmd> split <CR>", "split horizontal" },
        ["<leader>sv"] = { "<cmd> vsplit <CR>", "split vertical" },
        ["<leader>wd"] = { "<cmd> q <CR>", "delete window" },
        ["<leader>bb"] = { function() require("telescope.builtin").buffers() end, "switch buffer" },
        ["<leader>bd"] = { "<cmd> bdelete <CR>", "delete buffer" },
        ["<leader>bc"] = { "<cmd> enew <CR>", "create buffer" },
        ["<leader>t<leader>"] = { "<cmd> Telescope <CR>", "telescope" },
        ["n"] = { "nzzzv", "center search" },
        ["<f2>"] = { function() require("telescope.builtin").keymaps() end, "show keymaps" },
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
        ["gD"] = { function() require("telescope.builtin").lsp_references() end, "go to references" },
        ["<leader>;f"] = { function() vim.o.guifont='Hack:h24' end, "big font mode" }, -- TODO: a way to switch back
    },
    i = {
        ["<C-backspace>"] = { "<esc>bcw", opts = { nowait = true } },
    },
}

return M
