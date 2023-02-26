local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

local servers = {
  "ltex-ls",
  "clangd",
  "pylsp",
  "json-lsp",
  "cmake-language-server",
  "bash-language-server",
  "lua-language-server",
  "vim-language-server",
  "docerfile-language-server",
  "yaml-language-server",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
