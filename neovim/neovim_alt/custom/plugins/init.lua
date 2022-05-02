return {
    ["folke/which-key.nvim"] = {
        config = function()
            require('which-key').setup{
                key_labels = {
                    ['<space>'] = "SPC",
                    ['<cr>'] = "RET",
                    ['<tab>'] = "TAB",
                }
            }
        end,
    },
    ["nvim-telescope/telescope-file-browser.nvim"] = {
        config = function()
            require('telescope').load_extension('file_browser')
        end,
    },
    ["nvim-telescope/telescope-project.nvim"] = {
        config = function()
            require('telescope').load_extension('project')
        end,
    },
    ["TimUntersberger/neogit"] = {
        config = function()
            require('neogit').setup{}
        end,
    },
    ["nvim-orgmode/orgmode"] = {
        config = function()
            require('orgmode').setup{}
            require('orgmode').setup_ts_grammar{}
        end,
    },
}
