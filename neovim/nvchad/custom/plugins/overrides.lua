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
        "file_browser",
        "project",
    },
    -- TODO: telescope mappings (from the old config)
}

M.blankline = {
    show_current_context = false,
}

return M
