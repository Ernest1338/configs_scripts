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

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
