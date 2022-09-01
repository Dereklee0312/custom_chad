local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
    -- c/cpp
    "clangd",
    "csharp_ls",

    -- python
    "pyright",

    -- Bash
    "bashls",

    "sqlls",

    -- Javascript
    "quick_lint_js",
    "tsserver"
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- lspconfig["sqlls"].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     -- root_dir = lspconfig.util.root_pattern "*.sql",
-- }
