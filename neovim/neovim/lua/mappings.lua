-- file location: ~/.config/nvim/lua/mappings.lua

-- TODO: mapping to toggle comments would be cool
-- (https://github.com/terrortylor/nvim-comment)

-- remap space as leader key
--vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- use f2 fo show whichkey window
vim.keymap.set({ "n", "v", "i", "s" }, "<f2>", "<cmd>WhichKey<cr>", { silent = true })

-- LSP mappings
vim.keymap.set({ "n" }, "K", function()
    local line_diagnostics = vim.lsp.diagnostic.get_line_diagnostics()
    if vim.tbl_isempty(line_diagnostics) then
        vim.lsp.buf.hover()
    else
        vim.diagnostic.open_float()
    end
end, { silent = true })
vim.keymap.set({ "n" }, "gd", function() vim.lsp.buf.definition() end, { silent = true })
vim.keymap.set({ "n" }, "gD", "<cmd>Telescope lsp_references<cr>", { silent = true })
vim.keymap.set({ "n" }, "gi", function() vim.lsp.buf.implementation() end, { silent = true })

-- luasnip mappings
local ls = require("luasnip")
-- ctrl+; for snippet completition
vim.keymap.set({ "i", "s" }, "<c-;>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })
-- ctrl+: for jumping back
vim.keymap.set({ "i", "s" }, "<c-:>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })
-- ctrl+alt+; for snippet choice list toggle
vim.keymap.set({ "i", "s" }, "<c-a-;>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })

-- telescope mappings
local fb_actions = require("telescope").extensions.file_browser.actions
require("telescope").setup{
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = require("telescope.actions").move_selection_next,
                ["<C-k>"] = require("telescope.actions").move_selection_previous,
                -- Ctrl + Enter to create file/folder if no results found
                ["<C-CR>"] = fb_actions.create_from_prompt,
            },
        },
    },
}

-- which key mappings
local wk = require("which-key")
wk.register({
    ["<leader>"] = {
        ["/"] = { "<cmd>Telescope live_grep<cr>", "Search" },
        ["?"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current file search" },
        ["<leader>"] = { "<cmd>Telescope find_files<cr>", "Find File" },
        T = { "<cmd>NvimTreeToggle<cr>", "Tree" },
        [","] = {
            name = "Tab",
            [","] = { "<cmd>tabnew<cr>", "New tab" },
            ["<tab>"] = { "<cmd>tabnext<cr>", "Switch tab" },
            c = { "<cmd>tabnew<cr>", "Create new tab" },
            d = { "<cmd>tabclose<cr>", "Delete tab" },
            n = { "<cmd>tabnext<cr>", "Next tab" },
            p = { "<cmd>tabprevious<cr>", "Previous tab" },
        },
        [";"] = {
            name = "Prefix",
        },
        [":"] = { "<cmd>Telescope commands<cr>", "Commands" },
        b = {
            name = "Buffers",
            ["<tab>"] = { "<cmd>bnext<cr>", "Next buffer" },
            b = { "<cmd>Telescope buffers<cr>", "Switch buffer" },
            c = { "<cmd>enew<cr>", "Create new buffer" },
            d = { "<cmd>bdelete<cr>", "Delete buffer" },
            n = { "<cmd>bnext<cr>", "Next buffer" },
            p = { "<cmd>bprevious<cr>", "Previous buffer" },

        },
        f = {
            name = "File",
            ["/"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find" },
            c = { "<cmd>Telescope find_files cwd=~/.config/nvim/<cr>", "Edit neovim configs" },
            f = { "<cmd>Telescope find_files<cr>", "Find File" },
            n = { "<cmd>enew<cr>", "New File" },
            i = { "<cmd>f!<cr>", "File info (path)" },
            o = { "<cmd>Telescope file_browser cwd=~<cr>", "Open file" },
            O = { "<cmd>Telescope find_files cwd=~<cr>", "Global find file" },
            q = { "<cmd>wq<cr>", "Save and quit" },
            Q = { "<cmd>wq!<cr>", "Force save and quit" },
            r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
            R = { "<cmd>edit!<cr>", "Reload file" },
            s = { "<cmd>w<cr>", "Save file" },
            t = { "<cmd>Telescope filetypes<cr>", "File type" },
        },
        g = {
            name = "Git",
            g = { "<cmd>Neogit<cr>", "Neogit" },
            s = { "<cmd>Gitsigns toggle_signs<cr>", "Toggle signs" },
            l = { "<cmd>Gitsigns blame_line<cr>", "Blame line" },
            d = { "<cmd>Gitsigns diffthis<cr>", "Diff this" },
            n = { "<cmd>Gitsigns next_hunk<cr>", "Next hunk" },
            p = { "<cmd>Gitsigns prev_hunk<cr>", "Previous hunk" },
            x = { "<cmd>Gitsigns toggle_deleted<cr>", "Toggle deleted" },
            c = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle current line blame" },
            w = { "<cmd>Gitsigns toggle_word_diff<cr>", "Toggle word diff" },
        },
        h = {
            name = "Highlight", -- maybe something different, for now - highlight
            t = { [[<cmd>hi EoLSpace ctermbg=238 guibg=#802020<cr><cmd>match EoLSpace /\s\+$/<cr>]], "Highlight trailing spaces" },
        },
        l = {
            name = "LSP",
            a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "LSP code actions" },
            d = { "<cmd>Telescope diagnostics<cr>", "LSP diagnostics" },
            f = { "<cmd>lua vim.lsp.buf.formatting_sync(nil, 500)<cr>", "LSP format buffer" },
            R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "LSP rename" },
            r = { "<cmd>Telescope lsp_references<cr>", "LSP references" },
            S = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "LSP signature" },
            s = { "<cmd>Telescope lsp_document_symbols<cr>", "LSP symbols" },
            i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "LSP implementation" },
            t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "LSP type definition" },
            -- TODO: Even more mappings?
        },
        o = {
            name = "Open",
            f = { "<cmd>Telescope file_browser cwd=~<cr>", "Open file" },
            F = { "<cmd>Telescope find_files cwd=~<cr>", "Global find file" },
        },
        p = {
            name = "Projects",
            ["/"] = { "<cmd>Telescope live_grep<cr>", "Project search" },
            e = { "<cmd>edit "..os.getenv("HOME").."/.local/share/nvim/telescope-projects.txt<cr>", "Edit the projects file" },
            p = { "<cmd>Telescope project<cr>", "Project menu" },
        },
        q = {
            name = "Quit",
            q = { "<cmd>q<cr>", "Quit" },
            Q = { "<cmd>qall!<cr>", "Force quit" },
        },
        r = {
            name = "Remove",
            ["<space>"] = { [[<cmd>%s/\s\+$//e<cr>]], "Remove trailing spaces" },
            --r = { "<cmd>source $MYVIMRC<cr>", "Reload config" }, -- TODO: reload config mapping
        },
        s = {
            name = "Split",
            h = { "<cmd>split<cr>", "Horizontal" },
            v = { "<cmd>vsplit<cr>", "Vertical" },
        },
        t = {
            name = "Telescope",
            c = { "<cmd>Telescope commands<cr>", "Commands" },
            d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
            f = { "<cmd>Telescope file_browser<cr>", "File browser" },
            g = { "<cmd>Telescope git_files<cr>", "Find git files" },
            s = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
            ["<space>"] = { "<cmd>Telescope<cr>", "Telescope" },
            t = { "<cmd>tabnext<cr>", "Next tab" },
            n = { "<cmd>tabnew<cr>", "New tab" },
            T = { "<cmd>TodoTelescope<cr>", "Telescope TODO list" },
        },
        ["<tab>"] = {
            name = "Workspace",
        },
        w = {
            name = "Window",
            ["<tab>"] = { "<C-w>w", "Cycle windows" },
            c = { "<cmd>q<cr>", "Close window" },
            d = { "<cmd>q<cr>", "Delete window" },
            H = { "<C-w><", "Resize left" },
            h = { "<cmd>wincmd h<cr>", "Left window" },
            J = { "<C-w>-", "Resize down" },
            j = { "<cmd>wincmd j<cr>", "Down window" },
            k = { "<cmd>wincmd k<cr>", "Up window" },
            K = { "<C-w>+", "Resize up" },
            l = { "<cmd>wincmd l<cr>", "Right window" },
            L = { "<C-w>>", "Resize right" },
            n = { "<C-w>vnew", "New window" },
            w = { "<C-w>w", "Cycle windows" },
        },
    },
})

