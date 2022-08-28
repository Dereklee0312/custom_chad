-- custom/plugins/init.lua return table of plugins

return {
  ["p00f/nvim-ts-rainbow"] = {},

  -- Custom lsp config
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.configs.lspconfig"
    end,
  },

  -- Smart comments
  ["tpope/vim-commentary"] = {},

  -- Telescope config overwrite
  ["nvim-telescope/telescope.nvim"] = {
      config = function()
          require "plugins.configs.telescope"
          require "custom.plugins.configs.telescope"
      end,
      },
}
