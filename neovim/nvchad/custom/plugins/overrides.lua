local M = {}

M.treesitter = {
    ensure_installed = {
        "bash",
        "lua",
        "cpp",
        "markdown",
        "python",
        "rust",
    },
}

M.mason = {
    ensure_installed = {
        "rust-analyzer",
    },
}

M.telescope = {
    extensions_list = {
        "themes",
        "terms",
    },
    -- TODO: telescope mappings (from the old config)
}

M.blankline = {
    show_current_context = false,
}

M.nvterm = {
    terminals = {
        type_opts = {
            float = {
                -- make the popup terminal bigger
                row = 0.1,
                col = 0.1,
                width = 0.8,
                height = 0.8,
            },
        },
    },
}

return M
