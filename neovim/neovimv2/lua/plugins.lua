return {
    -- { "ellisonleao/gruvbox.nvim",    priority = 1000 },
    { "tanvirtin/monokai.nvim",      priority = 1000 },
    --{
    -- "Ernest1338/nightfox.nvim",
    -- priority = 1000,
    -- },
    -- {
    --     "nvim-telescope/telescope.nvim",
    --     event = "VeryLazy", -- might want to lazy load, comment that out
    --     dependencies = {
    --         { "nvim-lua/plenary.nvim" },
    --         { "nvim-telescope/telescope-project.nvim" },
    --     },
    --     config = function()
    --         local ts = require("telescope")
    --         local ts_actions = require("telescope.actions")
    --         ts.load_extension("project")
    --         ts.setup {
    --             defaults = {
    --                 mappings = {
    --                     i = {
    --                         ["<C-j>"] = ts_actions.move_selection_next,
    --                         ["<C-k>"] = ts_actions.move_selection_previous,
    --                     },
    --                 },
    --             },
    --         }
    --     end,
    --     cmd = "Telescope"
    -- },
    {
        "nvim-treesitter/nvim-treesitter",
        -- event = { "BufReadPre", "BufNewFile" },
        event = "VeryLazy",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                highlight = { enable = true, },
                indent = { enable = true },
            }
        end
    },
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        config = function()
            local nvim_lsp = require("lspconfig")
            local on_attach = function(client, _) -- _ = bufnr
                -- disabled, because it breaks highlighting and makes it slugish
                client.server_capabilities.semanticTokensProvider = nil
            end
            nvim_lsp["rust_analyzer"].setup {
                on_attach = on_attach,
                settings = {
                    ["rust-analyzer"] = {
                        diagnostics = {
                            enable = true,
                            disabled = { "unresolved-proc-macro" },
                            --enableExperimental = true,
                        },
                    },
                },
            }
            nvim_lsp["pylsp"].setup {
                on_attach = on_attach,
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle = {
                                maxLineLength = 120,
                                ignore = { "E265", "E722" }
                            },
                            mccabe = {
                                enabled = false
                            }
                        }
                    }
                }
            }
            nvim_lsp["lua_ls"].setup {
                on_attach = on_attach,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim", "jit" },
                        },
                    },
                },
            }
            nvim_lsp["zls"].setup {
                on_attach = on_attach,
            }
            nvim_lsp["gopls"].setup {
                on_attach = on_attach,
            }
        end
    },
    {
        "L3MON4D3/LuaSnip",
        event = "VeryLazy", -- change to InsertEnter to lazy load
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    },
    {
        "hrsh7th/nvim-cmp",
        event = "VeryLazy", -- change to InsertEnter to lazy load
        dependencies = {
            "hrsh7th/cmp-buffer",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
        },
        config = function()
            local luasnip = require("luasnip")
            local cmp = require("cmp")
            cmp.setup {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                sources = {
                    { name = "nvim_lsp", keyword_length = 1 },
                    { name = "path" },
                    { name = "luasnip",  keyword_length = 2 },
                    { name = "buffer",   keyword_length = 2 },
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ["<A-;>"] = cmp.mapping(function(fallback)
                        if luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<CR>"] = cmp.mapping.confirm({
                        select = false
                    }),
                }),
                -- Dont ever autoselect options (maybe reconsider autoselecting)
                preselect = cmp.PreselectMode.None,
                formatting = {
                    format = function(_, vim_item)
                        local kind_icons = {
                            Text = "",
                            Method = "⍟",
                            Function = "∮",
                            Constructor = "",
                            Field = "⍑",
                            Variable = "⭗",
                            Class = "©",
                            Interface = "",
                            Module = "",
                            Property = "ﰠ",
                            Unit = "",
                            Value = "⮈",
                            Enum = "",
                            Keyword = "⌘",
                            Snippet = "",
                            Color = "☀",
                            File = "⛶",
                            Reference = "",
                            Folder = "⛘",
                            EnumMember = "",
                            Constant = "∁",
                            Struct = "",
                            Event = "",
                            Operator = "∑",
                            TypeParameter = "∡"
                        }
                        vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
                        return vim_item
                    end
                },
                cmp.event:on(
                    'confirm_done',
                    require("nvim-autopairs.completion.cmp").on_confirm_done()
                )
            }
        end
    },
    {
        "echasnovski/mini.comment",
        event = "VeryLazy",
        opts = {
            mappings = {
                comment_visual = "<leader>/",
            }
        }
    },
    -- {
    --     "echasnovski/mini.base16",
    --     lazy = false,
    --     config = function()
    --          require("mini.base16").setup({
    --              palette = {
    --                  -- base00 = "#1d2021",
    --                  -- base00 = "#1f2223",
    --                  base00 = "#282828",
    --                  base01 = "#3c3836",
    --                  base02 = "#504945",
    --                  base03 = "#665c54",
    --                  base04 = "#bdae93",
    --                  base05 = "#d5c4a1",
    --                  base06 = "#ebdbb2",
    --                  base07 = "#fbf1c7",
    --                  base08 = "#fb4934",
    --                  base09 = "#fe8019",
    --                  base0A = "#fabd2f",
    --                  base0B = "#b8bb26",
    --                  base0C = "#8ec07c",
    --                  base0D = "#83a598",
    --                  base0E = "#d3869b",
    --                  base0F = "#d65d0e",
    --              },
    --              use_cterm = true
    --          })
    --     end
    -- },
    {
        "echasnovski/mini.jump2d",
        event = "VeryLazy",
        opts = {
            mappings = {
                start_jumping = "<leader>j",
            }
        }
    },
    {
        "echasnovski/mini.tabline",
        event = "BufEnter",
        config = true,
    },
    -- {
    --     "echasnovski/mini.statusline",
    --     event = "BufEnter",
    --     config = function()
    --         require("mini.statusline").setup {
    --             content = {
    --                 inactive = require("mini.statusline").active, -- HACK for termcol process exit
    --             },
    --         }
    --     end
    -- },
    -- {
    --     "echasnovski/mini.cursorword",
    --     event = "VeryLazy",
    --     config = { delay = 1000 }
    -- },
    {
        "echasnovski/mini.files",
        event = "VeryLazy",
        opts = {
            mappings = {
                go_in_plus = "<CR>",
            },
            -- windows = {
            --     preview = true,
            -- },
            options = {
                permanent_delete = false,
            },
        }
    },
    {
        "echasnovski/mini.pick",
        event = "VeryLazy",
        config = function()
            require("mini.pick").setup {
                mappings = {
                    move_up = "<C-k>",
                    move_down = "<C-j>",
                },
                options = {
                    use_cache = true,
                },
                window = {
                    config = function()
                        local height = math.floor(0.7 * vim.o.lines)
                        local width = math.floor(0.7 * vim.o.columns)
                        return {
                            anchor = 'NW',
                            height = height,
                            width = width,
                            row = math.floor(0.5 * (vim.o.lines - height)),
                            col = math.floor(0.5 * (vim.o.columns - width)),
                            border = 'rounded',
                        }
                    end
                }
            }
            vim.cmd("hi MiniPickMatchRanges guifg=#51A0CF")
            MiniPick.registry.files = function(local_opts)
                local opts = { source = { cwd = local_opts.cwd } }
                local_opts.cwd = nil
                return MiniPick.builtin.files(local_opts, opts)
            end
        end
    },
    "Ernest1338/mini.pickaproject",
    -- {
    --     "echasnovski/mini.nvim",
    --     lazy = false,
    --     -- event = "VeryLazy",
    --     config = function()
    --         require("mini.pick").setup {
    --             mappings = {
    --                 move_up = "<C-k>",
    --                 move_down = "<C-j>",
    --             },
    --             -- options = {
    --             --     content_from_bottom = true,
    --             --     use_cache = true,
    --             -- }
    --         }
    --         MiniPick.registry.files = function(local_opts)
    --             local opts = { source = { cwd = local_opts.cwd } }
    --             local_opts.cwd = nil
    --             return MiniPick.builtin.files(local_opts, opts)
    --         end
    --         require("mini.comment").setup {
    --             mappings = {
    --                 comment = "<leader>/",
    --             },
    --         }
    --         require("mini.tabline").setup {}
    --         require("mini.jump2d").setup {
    --             mappings = {
    --                 start_jumping = "<leader>j",
    --             },
    --         }
    --         require("mini.statusline").setup {
    --             content = {
    --                 inactive = require("mini.statusline").active, -- HACK for termcol process exit
    --             },
    --         }
    --         require("mini.files").setup {
    --             mappings = {
    --                 go_in_plus = "<CR>",
    --             },
    --             -- windows = {
    --             --     preview = true,
    --             -- },
    --             options = {
    --                 permanent_delete = false,
    --             },
    --         }
    --         require("mini.cursorword").setup { delay = 500 }
    --         -- require("mini.base16").setup({
    --         --     palette = {
    --         --         -- base00 = "#1d2021",
    --         --         -- base00 = "#1f2223",
    --         --         base00 = "#282828",
    --         --         base01 = "#3c3836",
    --         --         base02 = "#504945",
    --         --         base03 = "#665c54",
    --         --         base04 = "#bdae93",
    --         --         base05 = "#d5c4a1",
    --         --         base06 = "#ebdbb2",
    --         --         base07 = "#fbf1c7",
    --         --         base08 = "#fb4934",
    --         --         base09 = "#fe8019",
    --         --         base0A = "#fabd2f",
    --         --         base0B = "#b8bb26",
    --         --         base0C = "#8ec07c",
    --         --         base0D = "#83a598",
    --         --         base0E = "#d3869b",
    --         --         base0F = "#d65d0e",
    --         --     },
    --         --     use_cterm = true
    --         -- })
    --         -- TODO: switch to mini.completion when mini.snippets is available (and switch to mini.snippets and mini.pairs)
    --         -- TODO: use mini.git
    --         -- require("mini.pairs").setup {}
    --         -- require("mini.indentscope").setup {}
    --         -- require("mini.starter").setup {}
    --         -- local hipatterns = require("mini.hipatterns")
    --         -- hipatterns.setup {
    --         --     highlighters = {
    --         --         -- Highlight hex color strings (`#rrggbb`) using that color
    --         --         hex_color = hipatterns.gen_highlighter.hex_color(),
    --         --     },
    --         --     delay = {
    --         --         text_change = 500,
    --         --         scroll = 500,
    --         --     }
    --         -- }
    --         -- local miniclue = require('mini.clue')
    --         -- miniclue.setup({
    --         --     triggers = {
    --         --         -- Leader triggers
    --         --         { mode = 'n', keys = '<Leader>' },
    --         --         { mode = 'x', keys = '<Leader>' },
    --         --
    --         --         -- Built-in completion
    --         --         { mode = 'i', keys = '<C-x>' },
    --         --
    --         --         -- `g` key
    --         --         { mode = 'n', keys = 'g' },
    --         --         { mode = 'x', keys = 'g' },
    --         --
    --         --         -- Marks
    --         --         { mode = 'n', keys = "'" },
    --         --         { mode = 'n', keys = '`' },
    --         --         { mode = 'x', keys = "'" },
    --         --         { mode = 'x', keys = '`' },
    --         --
    --         --         -- Registers
    --         --         { mode = 'n', keys = '"' },
    --         --         { mode = 'x', keys = '"' },
    --         --         { mode = 'i', keys = '<C-r>' },
    --         --         { mode = 'c', keys = '<C-r>' },
    --         --
    --         --         -- Window commands
    --         --         { mode = 'n', keys = '<C-w>' },
    --         --
    --         --         -- `z` key
    --         --         { mode = 'n', keys = 'z' },
    --         --         { mode = 'x', keys = 'z' },
    --         --     },
    --         --
    --         --     clues = {
    --         --         -- Enhance this by adding descriptions for <Leader> mapping groups
    --         --         miniclue.gen_clues.builtin_completion(),
    --         --         miniclue.gen_clues.g(),
    --         --         miniclue.gen_clues.marks(),
    --         --         miniclue.gen_clues.registers(),
    --         --         miniclue.gen_clues.windows(),
    --         --         miniclue.gen_clues.z(),
    --         --     },
    --         -- })
    --         -- NOTE: when mini.places releases, mappings: <l>kc - create, <l>kf - forward, <l>kF - backward
    --     end
    -- },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = true
    },
    { "shortcuts/no-neck-pain.nvim", cmd = "NoNeckPain", opts = { width = 120 } },
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        config = true
    },
    "nvim-tree/nvim-web-devicons",
    "Ernest1338/termplug.nvim",
    { "echasnovski/mini.extra", event = "VeryLazy", config = true },

    -- LOCAL PLUGIN DEVELOPMENT
    { "local/doctor",           dev = true },
    { "local/wordcount",        dev = true },
    { "local/training",         dev = true },
    { "local/statusline",       dev = true,         event = "BufEnter", config = true },
    -- { "local/termplug.nvim",              dev = true },
    -- { "local/mini.pickaproject",    dev = true },
    -- { "local/nightfox.nvim",              dev = true },
}
