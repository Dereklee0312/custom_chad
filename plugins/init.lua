-- custom/plugins/init.lua return table of plugins

local override = require "custom.override"

return {
  ----------------------------------------------------------------------------------------
  -- Installing new plugins
  ----------------------------------------------------------------------------------------
  --***********************************************************************************--
  --                                   Treesitter plugins                              --
  --***********************************************************************************--
  -- Rainbow brackets
  ["p00f/nvim-ts-rainbow"] = {
    after = "nvim-treesitter",
  },

  -- Holds context of current line
  ["nvim-treesitter/nvim-treesitter-context"] = {
    after = "nvim-treesitter",
    config = function()
      require "custom.plugins.configs.tscontext"
    end,
  },

  ["windwp/nvim-ts-autotag"] = {
    after = "nvim-treesitter",
  },

  --***********************************************************************************--
  --                                      LSP Plugins                                  --
  --***********************************************************************************--
  -- Custom lsp config
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.configs.lspconfig"
    end,
  },

  -- Formatting files
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.configs.null-ls"
    end,
  },

  -- Github copilot
  ["github/copilot.vim"] = {
    event = "InsertEnter",
    config = function()
      require "custom.plugins.configs.copilot"
    end,
  },
  --***********************************************************************************--
  --                                    NOTIFY plugins                                 --
  --***********************************************************************************--
  ["folke/noice.nvim"] = {
    event = "VimEnter",
    config = function()
      require "custom.plugins.configs.noice"
    end,
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },

  ["MunifTanjim/nui.nvim"] = {},

  ["rcarriga/nvim-notify"] = {
    config = function()
      require "custom.plugins.configs.notify"
    end,
  },

  --***********************************************************************************--
  --                                    OTHER plugins                                  --
  --***********************************************************************************--
  -- Telescope config overwrite
  ["nvim-telescope/telescope.nvim"] = {
    config = function()
      require "plugins.configs.telescope"
      require "custom.plugins.configs.telescope"
    end,
  },

  -- Startuptime
  ["dstein64/vim-startuptime"] = {
    event = "VimEnter",
  },

  ["NvChad/ui"] = {
    config = function()
      require("custom.ui").setup()
    end,
  },

  -- Forked repo for base46
  -- ["Dereklee0312/base46"] = {
  --   branch = "Oceanic-Next-Light",
  --   config = function()
  --     local ok, base46 = pcall(require, "base46")
  --
  --     if ok then
  --       base46.load_theme()
  --     end
  --   end,
  -- },
  --------------------------------------------------------------------------------------
  -- Overriding configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = override.treesitter,
  },
  ["williamboman/mason.nvim"] = {
    override_options = override.mason,
  },
  ["kyazdani42/nvim-tree.lua"] = {
    override_options = override.ntree,
  },
  ["NvChad/nvterm"] = {
    override_options = override.nvterm,
  },
  --------------------------------------------------------------------------------------
  -- Removing plugins
  ["folke/which-key.nvim"] = false,
  -- ["NvChad/base46"] = false,
}
