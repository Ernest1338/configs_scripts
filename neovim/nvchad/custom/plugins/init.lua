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

    ["neovim/nvim-lspconfig"] = {
        config = function () require("custom.plugins.lspconfig") end,
    },

    ["TimUntersberger/neogit"] = {
        -- this lazy loading works, but i'm not sure why (lol)
        module = "neogit",
        keys = {"gc", "gb"},
        config = function () require("neogit").setup{} end,
    },

    ["goolord/alpha-nvim"] = false,
    ["folde/which-key.nvim"] = false,
    ["NvChad/nvim-colorizer.lua"] = false,
    --["kyazdani42/nvim-tree.lua"] = false,
}
