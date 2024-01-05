return {
    -- My plugins
    { "Ernest1338/egruvbox",           priority = 1000 },
    "Ernest1338/mini.pickaproject",
    "Ernest1338/termplug.nvim",
    { "Ernest1338/eg-statusline.nvim", event = "BufEnter", config = true },

    -- { "ellisonleao/gruvbox.nvim",    priority = 1000 },
    -- { "tanvirtin/monokai.nvim",      priority = 1000 },
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
            nvim_lsp["clangd"].setup {
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
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
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
            -- Lsp hover window border
            vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
                vim.lsp.handlers.hover,
                { border = 'rounded' }
            )
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
            MiniPick.registry.files = function(local_opts)
                local opts = { source = { cwd = local_opts.cwd } }
                local_opts.cwd = nil
                return MiniPick.builtin.files(local_opts, opts)
            end
            MiniPick.registry.filetype = function()
                local filetype = MiniPick.start({ source = { items = vim.fn.getcompletion("", "filetype") } })
                if filetype ~= nil then
                    vim.api.nvim_buf_set_option(0, 'filetype', filetype)
                end
            end
        end
    },
    -- {
    --     "echasnovski/mini.notify",
    --     event = "VeryLazy",
    --     config = true
    -- },
    -- {
    --     "echasnovski/mini.visits",
    --     event = "VeryLazy",
    --     config = true
    -- },
    -- {
    --     "echasnovski/mini.cursorword",
    --     event = "VeryLazy",
    --     config = { delay = 1000 }
    -- },
    -- {
    --     "echasnovski/mini.nvim",
    --     lazy = false,
    --     -- event = "VeryLazy",
    --     config = function()
    --         -- TODO: switch to mini.completion when mini.snippets is available (and switch to mini.snippets and mini.pairs)
    --         -- TODO: use mini.git
    --         -- TODO: when mini.places releases, mappings: <l>kc - create, <l>kf - forward, <l>kF - backward
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
    { "echasnovski/mini.extra",      event = "VeryLazy", config = true },

    -- LOCAL PLUGIN DEVELOPMENT
    { "local/doctor",                dev = true },
    { "local/wordcount",             dev = true },
    { "local/training",              dev = true },
    -- { "local/statusline",       dev = true,         event = "BufEnter", config = true },
    -- { "local/termplug.nvim",              dev = true },
    -- { "local/mini.pickaproject",    dev = true },
    -- { "local/nightfox.nvim",              dev = true },
}
