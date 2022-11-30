local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
-- local servers = {
--
--   -- python
--   "pyright",
--
--   -- Bash
--   "bashls",
--
--   -- SQL
--   "sqls",
--
--   -- HTML & CSS
--   "emmet_ls",
--   "cssls",
--
--   -- Markdown
--   "grammarly",
-- }
--
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end

lspconfig.tsserver.setup {
  init_options = {
    hostInfo = "neovim",
  },
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function(fname)
    return lspconfig.util.root_pattern "*.js"(fname)
      or lspconfig.util.root_pattern("package.json", "jsconfig.json", ".git")(fname)
  end,
}

lspconfig.csharp_ls.setup {
  init_options = {
    hostInfo = "neovim",
  },
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function(fname)
    return lspconfig.util.root_pattern "*.cs"(fname)
      or lspconfig.util.root_pattern("*.sln", "*.csproj", "*.fsproj", ".git")(fname)
  end,
}

vim.diagnostic.config { virtual_text = false }
