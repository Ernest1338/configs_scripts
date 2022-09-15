-- file location: ~/.config/nvim/lua/plugins.lua

return require("packer").startup({function()
    -- package manager
    use "wbthomason/packer.nvim"

    -- improve startup time by caching some plugins
    use "lewis6991/impatient.nvim"

    -- theme (potentially not necessary)
    use "ellisonleao/gruvbox.nvim"
    --use "luisiacc/gruvbox-baby"
    --use "tanvirtin/monokai.nvim"
    --use "navarasu/onedark.nvim"
    --use {
    --    "catppuccin/nvim",
    --    config = function() require("catppuccin").setup{} end
    --}

    -- treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup{
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                }
            }
        end
    }

    -- telescope file browser addon
    use "nvim-telescope/telescope-file-browser.nvim"

    -- telescope project management addon
    use "nvim-telescope/telescope-project.nvim"

    -- telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").load_extension("file_browser")
            require("telescope").load_extension("project")
        end
    }

    -- status line
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function() require("lualine").setup{
            --options = {
                --path = 3,
            --}
        } end
    }

    -- great snippets plugin, needs setting up (slowest plugin but whatever)
    use {
        "L3MON4D3/LuaSnip",
        config = function() require("luasnip.loaders.from_vscode").lazy_load() end
    }

    -- snippets collection
    use "rafamadriz/friendly-snippets"

    -- completion framework
    use {
        "hrsh7th/nvim-cmp",
        requires = { -- (some potentially not necessary)
            "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path", "saadparwaiz1/cmp_luasnip"
        },
        config = function()
            -- TODO:
            -- if one result, tab -> select and quit so tab+enter goes to new line
            -- multi results, tab -> selects next result enter confirms
            local cmp = require("cmp")
            cmp.setup{
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                sources = {
                    { name = "nvim_lsp", keyword_length = 1 },
                    { name = "path" },
                    { name = "luasnip", keyword_length = 2 },
                    { name = "buffer", keyword_length = 2 },
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<CR>"] = cmp.mapping.confirm({
                        --behavior = cmp.ConfirmBehavior.Insert,
                        --select = true
                        select = false
                    }),
                }),
                -- Dont ever autoselect options (maybe reconsider autoselecting)
                preselect = cmp.PreselectMode.None,
                formatting = {
                    format = function(entry, vim_item)
                        local kind_icons = {
                            Text = "",
                            Method = "",
                            Function = "",
                            Constructor = "",
                            Field = "",
                            Variable = "",
                            Class = "ﴯ",
                            Interface = "",
                            Module = "",
                            Property = "ﰠ",
                            Unit = "",
                            Value = "",
                            Enum = "",
                            Keyword = "",
                            Snippet = "",
                            Color = "",
                            File = "",
                            Reference = "",
                            Folder = "",
                            EnumMember = "",
                            Constant = "",
                            Struct = "",
                            Event = "",
                            Operator = "",
                            TypeParameter = ""
                        }
                        -- Kind icons
                        -- This concatonates the icons with the name of the item kind
                        vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
                        return vim_item
                    end
                  },
                --sorting = {
                    --comparators = {
                        --cmp.config.compare.offset,
                        --cmp.config.compare.exact,
                        --cmp.config.compare.score,

                        --function(entry1, entry2)
                            --local _, entry1_under = entry1.completion_item.label:find "^_+"
                            --local _, entry2_under = entry2.completion_item.label:find "^_+"
                            --entry1_under = entry1_under or 0
                            --entry2_under = entry2_under or 0
                            --if entry1_under > entry2_under then
                                --return false
                            --elseif entry1_under < entry2_under then
                                --return true
                            --end
                        --end,

                        --cmp.config.compare.kind,
                        --cmp.config.compare.sort_text,
                        --cmp.config.compare.length,
                        --cmp.config.compare.order,
                    --},
                --},
            }
            -- auto pairs on methods, ... when confirming completion (doesnt work great)
            cmp.event:on(
                "confirm_done",
                require("nvim-autopairs.completion.cmp").on_confirm_done()
            )
        end
    }

    -- better rust support
    --use {
    --    "simrat39/rust-tools.nvim",
    --    config = function()
    --        require("rust-tools").setup{
    --            server = {
    --                standalone = true,
    --            },
    --            dap = {
    --                adapter = {
    --                    type = "executable",
    --                    command = "lldb-vscode",
    --                    name = "rt_lldb",
    --                },
    --            },
    --        }
    --    end
    --}

    -- format on buffer save (async)
    --use {
    --  "lukas-reineke/lsp-format.nvim",
    --  config = function()
    --      require("lsp-format").setup{}
    --  end
    --}

    -- magit but its nvim
    use {
        "TimUntersberger/neogit",
        config = function() require("neogit").setup{} end
    }

    -- git decorations (potentially not necessary)
    use {
        "lewis6991/gitsigns.nvim",
        config = function() require("gitsigns").setup{} end
    }

    -- org in nvim
    --use {
    --    "nvim-orgmode/orgmode",
    --    config = function()
    --        require("orgmode").setup{}
    --        require("orgmode").setup_ts_grammar()
    --    end
    --}

    -- auto brackets
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup{} end
    }

    -- file explorer / file tree
    --use {
        --"kyazdani42/nvim-tree.lua",
        --config = function() require("nvim-tree").setup{} end
    --}

    -- lsp configs
    use {
        "neovim/nvim-lspconfig",
        config = function()
            require("lspconfig").rust_analyzer.setup{
                settings = {
                    ["rust-analyzer"] = {
                        diagnostics = {
                            enable = true,
                            disabled = {"unresolved-proc-macro"},
                            --enableExperimental = true,
                        },
                    },
                },
            }
            -- lsp-format related config
            --require("lspconfig").rust_analyzer.setup{on_attach=require("lsp-format").on_attach}
        end
    }

    -- lsp installer (potentially not necessary)
    -- deprecated, TODO: using mason.nvim is better now
    --use {
    --    "williamboman/nvim-lsp-installer",
    --    config = function() require("nvim-lsp-installer").setup{} end
    --}

    -- highlight TODO, ... (potentially not necessary)
    use {
        "folke/todo-comments.nvim",
        config = function() require("todo-comments").setup{} end
    }

    -- doom emacs style key showcase
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup{
                key_labels = {
                    ["<space>"] = "SPC",
                    ["<cr>"] = "RET",
                    ["<tab>"] = "TAB",
                }
            }
        end
    }

    -- support for DAP protocol for debugging
    --use {
    --    "mfussenegger/nvim-dap",
    --    config = function()
    --        local dap = require("dap")
    --        dap.adapters.lldb = {
    --            type = "executable",
    --            command = "/usr/bin/lldb-vscode",
    --            name = "lldb"
    --        }
    --        dap.configurations.rust = {
    --            {
    --                name = "Launch Debug",
    --                type = "lldb",
    --                request = "launch",
    --                program = function()
    --                    return vim.fn.input("Path to executable: ", os.getenv("CARGO_TARGET_DIR") .. "/debug/" .. "")
    --                end,
    --                cwd = "${workspaceFolder}",
    --                stopOnEntry = false,
    --                args = {},
    --                initCommand = {},
    --                runInTerminal = false
    --            },
    --        }
    --    end
    --}

    -- ui for debugging
    --use {
    --    "rcarriga/nvim-dap-ui",
    --    config = function() require("dapui").setup{} end
    --}
    --
    -- better vim.ui looks (only used in rename so far)
    --use {
    --  "stevearc/dressing.nvim",
    --  config = function()
    --      require("dressing").setup{}
    --  end
    --}

end,
config = {
    --compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    display = {
        open_fn = function()
            return require("packer.util").float{ border = "rounded" }
        end,
        prompt_border = "rounded",
        compact = true,
   },
   git = {
       clone_timeout = 600,
   },
}})

