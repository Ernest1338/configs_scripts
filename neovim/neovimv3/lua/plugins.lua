--[[

TODO:
- mini completion + mini snippets + mini pairs
- when new nvim version drops (fork, change name, remove unused things (lsp name), change modes to long names)
  { "nvimdev/whiskyline.nvim", event = "BufEnter", config = true },
- statusline disappear when using <leaderlf (format) fix
- ? mini terminal
- ? mini git

]]
--

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function() require("mini.tabline").setup() end)

-- now(function() require("mini.starter").setup() end)

now(function()
    add("Ernest1338/egcolors.vim")
    vim.cmd("colorscheme mirage")
end)

now(function()
    add("Ernest1338/eg-statusline.nvim")
    require("statusline").setup()
end)

later(function() add("nvim-tree/nvim-web-devicons") end)

--
-- [[ MY PLUGINS ]] --
--
later(function()
    add("Ernest1338/mini.pickaproject")
    require("mini.pickaproject").setup()
end)

later(function()
    add("Ernest1338/termplug.nvim")
    require("termplug").setup()
end)

later(function()
    add("Ernest1338/cube-timer.nvim")
    require("cube-timer").setup()
end)

later(function()
    add("Ernest1338/training.nvim")
    require("training").setup()
end)

later(function()
    -- require("mini.notify").setup({
    --     content = {
    --         format = function(notif) return notif.msg end,
    --     },
    --     window = {
    --         config = {
    --             border = "none",
    --             anchor = "SE",
    --             row = vim.o.lines - 1
    --         },
    --         winblend = 100,
    --     }
    -- })
    vim.notify = require("mini.notify").make_notify()
end)

later(function() require("mini.comment").setup({ mappings = { comment_visual = "<leader>/" } }) end)

later(function() require("mini.jump2d").setup({ mappings = { start_jumping = "<leader>j" } }) end)

later(function() require("mini.files").setup({ mappings = { go_in_plus = "<CR>" }, options = { permanent_delete = false } }) end)

later(function() require("mini.move").setup({ mappings = { left = "H", right = "L", down = "J", up = "K" } }) end)

later(function() require("mini.bracketed").setup() end)

later(function()
    require("mini.pick").setup({
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
    })
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
end)

later(function() add("shortcuts/no-neck-pain.nvim") end)

later(function()
    add({ source = "nvim-treesitter/nvim-treesitter", hooks = { post_checkout = function() vim.cmd('TSUpdate') end } })
    require("nvim-treesitter.configs").setup {
        highlight = { enable = true, },
        indent = { enable = true },
    }
end)

later(function()
    add("neovim/nvim-lspconfig")
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
                    mccabe = { enabled = false }
                }
            }
        },
        lua_ls = {
            Lua = {
                diagnostics = {
                    globals = { "vim", "jit", "MiniPick", "MiniDeps", "MiniFiles" },
                },
            },
        },
        gopls = {},
        -- zls = {},
        -- clangd = {}
    }

    for server, settings in pairs(servers) do
        nvim_lsp[server].setup {
            on_attach = on_attach,
            settings = settings
        }
    end

    -- Auto start lsp on single file sessions
    vim.cmd("LspStart")
end)

later(function()
    add({ source = "L3MON4D3/LuaSnip", depends = { "rafamadriz/friendly-snippets" } })
    require("luasnip.loaders.from_vscode").lazy_load()
end)

later(function()
    add("windwp/nvim-autopairs")
    require("nvim-autopairs").setup()
end)

later(function()
    add({
        source = "hrsh7th/nvim-cmp",
        depends = {
            "hrsh7th/cmp-buffer",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
        }
    })
    local luasnip = require("luasnip")
    local cmp = require("cmp")
    cmp.setup({
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
    })
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
end)

later(function()
    add("lewis6991/gitsigns.nvim")
    require('gitsigns').setup({
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map('n', ']h', function()
                if vim.wo.diff then return ']c' end
                vim.schedule(function() gs.next_hunk() end)
                return '<Ignore>'
            end, { expr = true })

            map('n', '[h', function()
                if vim.wo.diff then return '[c' end
                vim.schedule(function() gs.prev_hunk() end)
                return '<Ignore>'
            end, { expr = true })

            map('n', '<leader>gp', gs.preview_hunk)
            map('n', '<leader>gt', gs.toggle_current_line_blame)
            -- NOTE: maybe more mappings?
        end
    })
end)

-- later(function() require("mini.visits").setup() end)

-- later(function() require("mini.cursorword").setup({ delay = 500 }) end)

later(function()
    local hipatterns = require("mini.hipatterns")
    hipatterns.setup {
        highlighters = {
            fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFix' },
            fix       = { pattern = '%f[%w]()FIX()%f[%W]', group = 'MiniHipatternsFix' },
            warning   = { pattern = '%f[%w]()WARNING()%f[%W]', group = 'MiniHipatternsWarning' },
            hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsWarning' },
            todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
            note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
            perf      = { pattern = '%f[%w]()PERF()%f[%W]', group = 'MiniHipatternsPerf' },
            -- Highlight hex color strings (`#rrggbb`) using that color
            hex_color = hipatterns.gen_highlighter.hex_color(),
        },
        delay = {
            text_change = 500,
            scroll = 500,
        }
    }
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
    vim.api.nvim_set_hl(0, 'MiniHipatternsFix', { fg = "#ffffff", bg = "#ff5f59", bold = true })
    vim.api.nvim_set_hl(0, "MiniHipatternsWarning", { fg = normal["bg"], bg = "#e0af68", bold = true })
    vim.api.nvim_set_hl(0, 'MiniHipatternsTodo', { fg = normal["bg"], bg = "#0db9d7", bold = true })
    vim.api.nvim_set_hl(0, 'MiniHipatternsNote', { fg = normal["bg"], bg = "#10b981", bold = true })
    vim.api.nvim_set_hl(0, "MiniHipatternsPerf", { fg = normal["bg"], bg = "#bb9af7", bold = true })
end)

-- Needs to be after every other mini module, I think
later(function() require("mini.extra").setup() end)

-- later(function()
--     add("nvimdev/indentmini.nvim")
--     require("indentmini").setup()
--     vim.cmd.highlight("IndentLine guifg=#222738")
-- end)

-- now(function()
--     add("nvimdev/dashboard-nvim")
--     require("dashboard").setup({
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
--     })
-- end)

-- later(function()
--     add("kwakzalver/duckytype.nvim")
--     require("duckytype").setup()
-- end)

--
-- [[ LOCAL PLUGIN DEV, DISABLED BY DEFAULT ]] --
--
if true then return end

vim.o.runtimepath = vim.o.runtimepath
    .. ",~/Repos/lua-fun/NvimPlugs/doctor"
    .. ",~/Repos/lua-fun/NvimPlugs/wordcount"
    .. ",~/Repos/lua-fun/NvimPlugs/typing-test"
-- .. ",~/Repos/egcolors.vim"
-- .. ",~/Repos/termplug.nvim"
-- .. ",~/Repos/eg-statusline.nvim"
-- .. ",~/Repos/mini.pickaproject"
-- .. ",~/Repos/training.nvim"

later(function() require("typing-test").setup() end)
-- later(function() vim.cmd("colorscheme mirage") end)
-- later(function() require("termplug").setup() end)
-- later(function() require("statusline").setup() end)
-- later(function() require("mini.pickaproject").setup() end)
-- later(function() require("training").setup() end)
