--[[

TODOs:
- mini terminal
- mini deps
- mini git
- mini completion + mini snippets + mini pairs

- when new nvim version drops (fork, change name, remove unused things (lsp name), change modes to long names)
- { "nvimdev/whiskyline.nvim", event = "BufEnter", config = true },

]]
--

return {
    -- My plugins
    -- { "Ernest1338/egruvbox",           priority = 1000 },
    { "Ernest1338/egcolors.vim",       priority = 1000 },
    "Ernest1338/mini.pickaproject",
    "Ernest1338/termplug.nvim",
    { "Ernest1338/eg-statusline.nvim", event = "BufEnter", config = true },

    -- { "ellisonleao/gruvbox.nvim",    priority = 1000 },
    -- { "tanvirtin/monokai.nvim",      priority = 1000 },

    -- AI
    -- {
    --     "Exafunction/codeium.vim",
    --     event = "VeryLazy",
    --     config = function()
    --         local map = vim.keymap.set
    --         map('i', '<M-Bslash>', function() return vim.fn['codeium#Complete']() end, { expr = true, silent = true })
    --         map('i', '<M-]>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
    --         map('i', '<M-[>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
    --             { expr = true, silent = true })
    --         map('i', '<M-Enter>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    --     end
    -- },

    {
        "nvim-treesitter/nvim-treesitter",
        -- event = { "BufReadPre", "BufNewFile" },
        event = "VeryLazy", -- BufEnter might be better
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

                -- LSP mappings
                local map = vim.keymap.set

                map("n", "K", function()
                    local line_diagnostics = vim.lsp.diagnostic.get_line_diagnostics()
                    if vim.tbl_isempty(line_diagnostics) then
                        vim.lsp.buf.hover()
                    else
                        vim.diagnostic.open_float()
                    end
                end)                                                                                          -- LSP button
                map("n", "<leader>lf", "<cmd> lua vim.lsp.buf.format({ async = true, timeout = 2000 }) <CR>") -- Format file
                map("n", "<leader>la", "<cmd> lua vim.lsp.buf.code_action() <CR>")                            -- LSP Code actions
                map("n", "<leader>ld", "<cmd> Pick diagnostic <CR>")                                          -- LSP Diagnostics
                map("n", "<leader>ls", "<cmd> Pick lsp scope='document_symbol' <CR>")                         -- LSP Symbols
                map("n", "<leader>lr", "<cmd> lua vim.lsp.buf.rename() <CR>")                                 -- Rename
                map("n", "<C-k>", "<cmd> lua vim.lsp.buf.hover() <CR>")                                       -- LSP show hover information
                map("n", "gd", "<cmd> Pick lsp scope='definition' <CR>")                                      -- Go to defifinition
                map("n", "gD", "<cmd> Pick lsp scope='references' <CR>")                                      -- Go to references
            end

            local servers = {
                rust_analyzer = {
                    ["rust_analyzer"] = {
                        diagnostics = {
                            enable = true,
                            disabled = { "unresolved-proc-macro" },
                            --enableExperimental = true,
                        }
                    }
                },
                pylsp = {
                    ["pylsp"] = {
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
                },
                lua_ls = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim", "jit", "MiniPick" },
                        },
                    },
                },
                zls = {},
                gopls = {},
                clangd = {}
            }

            for server, config in pairs(servers) do
                nvim_lsp[server].setup {
                    on_attach = on_attach,
                    settings = config
                }
            end
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

            -- Change diagnostic symbols
            vim.cmd([[
            sign define DiagnosticSignError text=✘ texthl=DiagnosticSignError linehl= numhl=
            sign define DiagnosticSignWarn text=» texthl=DiagnosticSignWarn linehl= numhl=
            sign define DiagnosticSignHint text=⚑ texthl=DiagnosticSignHint linehl= numhl=
            sign define DiagnosticSignInfo text=* texthl=DiagnosticSignInfo linehl= numhl=
            ]])

            -- diagnostic popup config
            vim.diagnostic.config({
                -- virtual_text = true,
                -- virtual_lines = true,
                --signs = false,
                float = { border = "rounded" },
            })
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
    --     'nvimdev/indentmini.nvim',
    --     event = 'BufEnter',
    --     config = function()
    --         require('indentmini').setup()
    --         vim.cmd.highlight("IndentLine guifg=#323232")
    --     end,
    -- },
    -- {
    --     "echasnovski/mini.notify",
    --     event = "VeryLazy",
    --     config = {
    --         content = {
    --             format = function(notif) return notif.msg end,
    --         },
    --         window = {
    --             config = {
    --                 border = 'none',
    --             },
    --             winblend = 50,
    --         }
    --     }
    -- },
    -- {
    --     "echasnovski/mini.visits",
    --     event = "VeryLazy",
    --     -- mappings?: <l>kc - create, <l>kf - forward, <l>kF - backward
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
        config = function()
            require('gitsigns').setup {
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', 'g]', function()
                        if vim.wo.diff then return ']c' end
                        vim.schedule(function() gs.next_hunk() end)
                        return '<Ignore>'
                    end, { expr = true })

                    map('n', 'g[', function()
                        if vim.wo.diff then return '[c' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<Ignore>'
                    end, { expr = true })

                    -- Actions
                    -- map('n', '<leader>hs', gs.stage_hunk)
                    -- map('n', '<leader>hr', gs.reset_hunk)
                    -- map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
                    -- map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
                    -- map('n', '<leader>hS', gs.stage_buffer)
                    -- map('n', '<leader>hu', gs.undo_stage_hunk)
                    -- map('n', '<leader>hR', gs.reset_buffer)
                    -- map('n', '<leader>hp', gs.preview_hunk)
                    -- map('n', '<leader>hb', function() gs.blame_line { full = true } end)
                    -- map('n', '<leader>tb', gs.toggle_current_line_blame)
                    -- map('n', '<leader>hd', gs.diffthis)
                    -- map('n', '<leader>hD', function() gs.diffthis('~') end)
                    -- map('n', '<leader>td', gs.toggle_deleted)

                    -- Text object
                    -- map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                end
            }
        end
    },
    { "shortcuts/no-neck-pain.nvim", cmd = "NoNeckPain", opts = { width = 120 } },
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        config = true
    },
    "nvim-tree/nvim-web-devicons",
    { "echasnovski/mini.extra",      event = "VeryLazy", config = true },

    -- { "echasnovski/mini.starter",    event = "VimEnter", config = true },
    -- {
    --     "nvimdev/dashboard-nvim",
    --     event = "VimEnter",
    --     config = {
    --         theme = "hyper",
    --         config = {
    --             -- header = {
    --             --     " ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓",
    --             --     " ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒",
    --             --     "▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░",
    --             --     "▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ",
    --             --     "▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒",
    --             --     "░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░",
    --             --     "░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░",
    --             --     "   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ",
    --             --     "         ░    ░  ░    ░ ░        ░   ░         ░   ",
    --             --     "                                ░                  ",
    --             --     ""
    --             -- },
    --             header = {
    --                 "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗     ██████╗ ██╗  ██╗ ██████╗ ███████╗ ██████╗███████╗",
    --                 "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║    ██╔═████╗╚██╗██╔╝██╔════╝ ██╔════╝██╔════╝╚════██║",
    --                 "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║    ██║██╔██║ ╚███╔╝ ███████╗ ███████╗███████╗    ██╔╝",
    --                 "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║    ████╔╝██║ ██╔██╗ ██╔═══██╗╚════██║██╔═══██╗  ██╔╝ ",
    --                 "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║    ╚██████╔╝██╔╝ ██╗╚██████╔╝███████║╚██████╔╝  ██║  ",
    --                 "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝     ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝ ╚═════╝   ╚═╝  ",
    --                 ""
    --             },
    --             shortcut = {
    --                 { desc = '[  Github]', group = 'DashboardShortCut' },
    --                 { desc = '[  Ernest1338]', group = 'DashboardShortCut' },
    --                 { desc = '[  v69.420]', group = 'DashboardShortCut' },
    --             },
    --             project = {
    --                 action = function(path) vim.cmd("Pick files cwd='" .. path .. "'") end
    --             },
    --         }
    --     }
    -- },

    -- LOCAL PLUGIN DEVELOPMENT
    { "local/doctor",                dev = true },
    { "local/wordcount",             dev = true },
    { "local/training",              dev = true },
    { "local/cube-timer",            dev = true },
    -- { "local/statusline",       dev = true,         event = "BufEnter", config = true },
    -- { "local/termplug.nvim",              dev = true },
    -- { "local/mini.pickaproject",    dev = true },
    -- { "local/nightfox.nvim",              dev = true },
}
