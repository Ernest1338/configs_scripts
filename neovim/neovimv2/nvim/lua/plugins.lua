return {
    { "ellisonleao/gruvbox.nvim", priority = 1000 },
    { "nvim-telescope/telescope.nvim", dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-file-browser.nvim" },
        { "nvim-telescope/telescope-project.nvim" },
    }, config = function()
        local ts = require("telescope")
        local fb_actions = ts.extensions.file_browser.actions
        local ts_actions = require("telescope.actions")
        ts.load_extension("file_browser")
        ts.load_extension("project")
        ts.setup {
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = ts_actions.move_selection_next,
                        ["<C-k>"] = ts_actions.move_selection_previous,
                        -- Ctrl + Enter to create file/folder if no results found
                        ["<C-CR>"] = fb_actions.create_from_prompt,
                    },
                },
            },
        }
    end, cmd = "Telescope" },
    { "TimUntersberger/neogit", cmd = "Neogit" },
    { "nvim-treesitter/nvim-treesitter", event = "BufReadPost", config = function()
        require("nvim-treesitter.configs").setup {
            highlight = { enable = true, },
            indent = { enable = true },
        }
    end },
    -- { "lukas-reineke/indent-blankline.nvim", event = "BufReadPre" },
    -- { "williamboman/mason.nvim", config = true, cmd = "Mason" },
    { "neovim/nvim-lspconfig", event = "BufReadPost", config = function()
        require("lspconfig").rust_analyzer.setup {}
        require("lspconfig").pyright.setup {}
        require("lspconfig").sumneko_lua.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        }
    end },
    { "L3MON4D3/LuaSnip", dependencies = {
        "rafamadriz/friendly-snippets",
    }, event = "BufReadPost", config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
    end },
    { "hrsh7th/nvim-cmp", event = "BufReadPost", dependencies = {
        "hrsh7th/cmp-buffer",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
    }, config = function()
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
                { name = "luasnip", keyword_length = 2 },
                { name = "buffer", keyword_length = 2 },
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-e>"] = cmp.mapping.abort(),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
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
                    vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
                    return vim_item
                end
            },
        }
    end },
    { "echasnovski/mini.nvim", event = "BufReadPost", config = function()
        require("mini.comment").setup {
            mappings = {
                comment = "<leader>/",
            },
        }
        require("mini.statusline").setup {}
        require("mini.tabline").setup {}
        -- require("mini.indentscope").setup {}
    end },
    { "m4xshen/autoclose.nvim", event = "BufReadPost", config = true },
}
