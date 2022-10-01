local M = {}

M.ui = {
    hl_override = {
        CursorLine = {
            bg = "black2",
        },
    },
    --[[changed_themes = {
        gruvbox = {
            base_16 = {
                base00 = "#141414",
            },
        },
    },]]--
    theme_toggle = { "gruvbox", "one_light" },
    theme = "gruvbox",
}

M.plugins = require "custom.plugins"
M.mappings = require "custom.mappings"

return M
