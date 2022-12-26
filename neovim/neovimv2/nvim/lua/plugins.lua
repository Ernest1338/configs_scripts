return {
    "ellisonleao/gruvbox.nvim",
    { "nvim-telescope/telescope.nvim", dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-file-browser.nvim" },
        { "nvim-telescope/telescope-project.nvim" },
    }, config = function()
        require("telescope").load_extension("file_browser")
        require("telescope").load_extension("project")
    end, cmd = "Telescope" },
    { "TimUntersberger/neogit", cmd = "Neogit" },
    { "nvim-treesitter/nvim-treesitter", event = "BufReadPost" },
    -- { "lukas-reineke/indent-blankline.nvim", event = "BufReadPre" },
    -- { "williamboman/mason.nvim", config = true, cmd = "Mason" },
    -- { "neovim/nvim-lspconfig", event = "BufReadPre", config = function()
    --     require("mason")
    --     require("lspconfig").rust_analyzer.setup {}
    --     require("lspconfig").pyright.setup {}
    --     require("lspconfig").sumneko_lua.setup {
    --         settings = {
    --             Lua = {
    --                 diagnostics = {
    --                     globals = { "vim" },
    --                 },
    --             },
    --         },
    --     }
    -- end },
    { "hrsh7th/nvim-cmp", event = "InsertEnter", dependencies = {
        "hrsh7th/cmp-buffer",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
    }, config = {
        sources = {
            { name = "buffer" },
            { name = "luasnip" },
            { name = "nvim_lua" },
            { name = "nvim_lsp" },
            { name = "path" },
        },
    } },
    { "numToStr/Comment.nvim", config = true },
    { "L3MON4D3/LuaSnip", dependencies = {
        "rafamadriz/friendly-snippets",
    } },
    { "m4xshen/autoclose.nvim", event = "BufReadPost", config = true },
}
