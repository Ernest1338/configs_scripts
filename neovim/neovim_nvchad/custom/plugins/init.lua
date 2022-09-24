local overrides = require "custom.plugins.overrides"

return {
    -- overrde plugin configs
    -- ["williamboman/mason.nvim"] = {
    --   override_options = overrides.mason,
    -- },

    -- remove plugin
    -- ["hrsh7th/cmp-path"] = false,

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
        config = function ()
            require("custom.plugins.lspconfig")
        end,
    },

    ["goolord/alpha-nvim"] = false,
    ["folde/which-key.nvim"] = false,
    ["NvChad/nvim-colorizer.lua"] = false,
}
