local lspconfig = require("lspconfig")
local nvchad_lspconfig = require("plugins.configs.lspconfig")

local on_attach = nvchad_lspconfig.on_attach
local capabilities = nvchad_lspconfig.capabilities

local servers = { "rust_analyzer" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
