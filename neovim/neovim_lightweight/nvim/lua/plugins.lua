return {
    { "nvim-telescope/telescope.nvim", dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-project.nvim" },
    }, config = function()
        local ts = require("telescope")
        local ts_actions = require("telescope.actions")
        ts.load_extension("project")
        ts.setup {
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = ts_actions.move_selection_next,
                        ["<C-k>"] = ts_actions.move_selection_previous,
                    },
                },
            },
        }
    end, cmd = "Telescope" },
    { "TimUntersberger/neogit", cmd = "Neogit" },
    -- { "nvim-treesitter/nvim-treesitter", event = "BufReadPost", config = function()
    --     require("nvim-treesitter.configs").setup {
    --         highlight = { enable = true, },
    --         indent = { enable = true },
    --     }
    -- end },
    -- { "neovim/nvim-lspconfig", event = "BufReadPost", config = function()
    --     require("lspconfig").rust_analyzer.setup {}
    --     require("lspconfig").pyright.setup {}
    --     require("lspconfig").sumneko_lua.setup {
    --         settings = {
    --             Lua = {
    --                 diagnostics = {
    --                     globals = { "vim" },
    --                 },
    --             },
    --         },
    --     }
    -- end },
    { "echasnovski/mini.nvim", event = "BufReadPost", config = function()
        require("mini.comment").setup {
            mappings = {
                comment = "<leader>/",
            },
        }
        require("mini.tabline").setup {}
        require("mini.statusline").setup {}
        require("mini.pairs").setup {}
        require("mini.completion").setup {}
    end },

    -- LOCAL PLUGIN DEVELOPMENT
    --{ "local/termplug", dev = true, lazy = false, config = true },
}
