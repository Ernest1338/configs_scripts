local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- NOTE: uncomment on first install
-- if not vim.loop.fs_stat(lazypath) then
--     vim.fn.system({
--         "git",
--         "clone",
--         "--filter=blob:none",
--         "--single-branch",
--         "https://github.com/folke/lazy.nvim.git",
--         lazypath,
--     })
-- end
vim.opt.runtimepath:prepend(lazypath)

-- enable the experimental lua-loader
vim.loader.enable()

-- map leader key as space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- codeium
-- vim.g.codeium_disable_bindings = 1
-- vim.g.codeium_manual = true

require("lazy").setup("plugins", {
    defaults    = { lazy = true },
    install     = { colorscheme = { "gruvbox8" } },
    dev         = {
        path = "~/Repos/lua-fun/NvimPlugs",
        patterns = { "local" },
    },
    ui          = {
        border = "rounded",
        title = "Lazy.nvim - Plugin Manager",
    },
    performance = {
        -- I believe this is the default now
        -- cache = {
        --     enabled = true,
        -- },
        rtp = {
            disabled_plugins = {
                "gzip",
                "man",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
                "nvim-treesitter-textobjects",
            },
        },
    },
})

require("configs")
require("mappings")
