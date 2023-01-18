-- map leader key as space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable some builtin plugins
local builtin_plugs = {
    "shada_plugin",
    "gzip",
    "matchit",
    "matchparen",
    "netrwPlugin",
    "tarPlugin",
    "2html_plugin",
    "tutor_mode_plugin",
    "zipPlugin",
}
for i = 1, #builtin_plugs do
    vim.g["loaded_" .. builtin_plugs[i]] = true
end

require("configs")
require("mappings")

require("mini.comment").setup {
    mappings = {
        comment = "<leader>/",
    },
}
require("mini.tabline").setup {}
require("mini.statusline").setup {}
require("mini.completion").setup {
    lsp_completion = {
        auto_setup = false,
    }
}
require("autoclose").setup {}

