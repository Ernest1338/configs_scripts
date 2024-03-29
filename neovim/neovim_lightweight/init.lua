-- map leader key as space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable some builtin plugins
local builtin_plugs = {
    "gzip",
    "man",
    "matchit",
    "matchparen",
    "netrwPlugin",
    "tarPlugin",
    "tohtml",
    "tutor",
    "zipPlugin",
    "shada_plugin",
    "2html_plugin",
    "tutor_mode_plugin",
    "remote_plugins"
}
for i = 1, #builtin_plugs do
    vim.g["loaded_" .. builtin_plugs[i]] = true
end

require("configs")
require("mappings")

-- load plugins only on BufReadPost event
local plugins_grp = vim.api.nvim_create_augroup("PluginsGrp", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        require("completion").setup {
            lsp_completion = {
                auto_setup = false,
            }
        }
        require("autoclose").setup {}
    end,
    group = plugins_grp,
})

