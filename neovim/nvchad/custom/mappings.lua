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
        ["<leader>fc"] = { "<cmd> Telescope find_files cwd=~/.config/nvim/lua/custom/ <CR>", "edit configs" },
        ["<leader>ft"] = { "<cmd> Telescope filetypes <CR>", "change file type" },
        ["<leader>fi"] = { "1<C-g>", "file info (path)" },
        ["<leader>fr"] = { "<cmd> Telescope oldfiles <CR>", "recent files" },
        ["<leader>of"] = { "<cmd> Telescope file_browser cwd=~ <CR>", "open file" },
        ["<leader>:"] = { "<cmd> Telescope commands <CR>", "commands" },
        ["<leader>pp"] = { "<cmd> Telescope project <CR>", "project menu" },
        ["<leader>pe"] = { "<cmd> edit ~/.local/share/nvim/telescope-projects.txt <CR>", "edit the projects list file" },
        ["<leader>gg"] = { "<cmd> lua require('neogit').open() <CR>", "neogit menu" },
        ["<leader>lf"] = { "<cmd> lua vim.lsp.buf.formatting_sync(nil, 2000) <CR>", "LSP format buffer" },
        ["n"] = { "nzzzv", "center search" },
        ["<f2>"] = { "<cmd> Telescope keymaps <CR>", "show keymaps" },
    },
    i = {
        ["<C-backspace>"] = { "<esc>bcw", opts = { nowait = true } },
    },
}

return M

