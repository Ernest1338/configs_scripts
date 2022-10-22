local overrides = require "custom.plugins.overrides"

return {
    ["nvim-telescope/telescope.nvim"] = {
        requires = {
            {
                "nvim-telescope/telescope-file-browser.nvim",
                after = "telescope.nvim",
                module = "telescope",
            },
            {
                "nvim-telescope/telescope-project.nvim",
                after = "telescope.nvim",
                module = "telescope",
            },
        },
        override_options = overrides.telescope,
    },

    ["nvim-treesitter/nvim-treesitter"] = {
        override_options = overrides.treesitter,
    },

    ["williamboman/mason.nvim"] = {
        override_options = overrides.mason,
    },

    ["neovim/nvim-lspconfig"] = {
        config = function()
            -- setup each lsp server
            require("lspconfig").rust_analyzer.setup {}
            require("lspconfig").pyright.setup {}
            require("lspconfig").sumneko_lua.setup {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            }
        end,
    },

    ["TimUntersberger/neogit"] = {
        -- this lazy loading works, but i'm not sure why (lol)
        module = "neogit",
        keys = { "gc", "gb" },
        config = function() require("neogit").setup {} end,
    },

    ["NvChad/nvim-colorizer.lua"] = false,
    --["kyazdani42/nvim-tree.lua"] = false,
}
