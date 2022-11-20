-- custom/plugins/init.lua return table of plugins

local override = require "custom.plugins.configs.override"

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
    opt = true,
    setup = function()
      require("core.lazy_load").on_file_open "nvim-lspconfig"
    end,
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
  -- ["folke/noice.nvim"] = {
  --   event = "VimEnter",
  --   config = function()
  --     require "custom.plugins.configs.noice1"
  --   end,
  -- },
  --
  -- ["MunifTanjim/nui.nvim"] = {
  --   after = "noice.nvim",
  -- },
  --
  -- ["rcarriga/nvim-notify"] = {
  --   after = "noice.nvim",
  --   config = function()
  --     require "custom.plugins.configs.notify"
  --   end,
  -- },

  --***********************************************************************************--
  --                                    OTHER plugins                                  --
  --***********************************************************************************--
  -- Enabling whichkey
  ["folke/which-key.nvim"] = {
    disable = false,
  },
  -- Telescope config overwrite
  ["nvim-telescope/telescope.nvim"] = {
    cmd = "Telescope",
    config = function()
      require "plugins.configs.telescope"
      require "custom.plugins.configs.telescope"
    end,
  },

  -- Telescope file browser extension
  ["nvim-telescope/telescope-file-browser.nvim"] = {
    cmd = "Telescope",
  },

  -- Startuptime
  ["dstein64/vim-startuptime"] = {
    cmd = "StartupTime",
  },

  ["NvChad/ui"] = {
    config = function()
      require("custom.ui").setup()
    end,
  },

  ["iamcco/markdown-preview.nvim"] = {
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  ["kylechui/nvim-surround"] = {
    event = "VimEnter",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup()
    end,
  },

  ["max397574/colortils.nvim"] = {
    cmd = "Colortils",
    config = function()
      require("colortils").setup {
        register = '"',
      }
    end,
    setup = function()
      require("core.utils").load_mappings "colortils"
    end,
  },

  ["abecodes/tabout.nvim"] = {
    config = function()
      require "custom.plugins.configs.tabout"
    end,
    wants = { "nvim-treesitter" },
    after = { "nvim-cmp" },
  },

  ["akinsho/git-conflict.nvim"] = {
    event = "VimEnter",
    tag = "*",
    config = function()
      require("git-conflict").setup()
    end,
  },
  -- Forked repo for base46
  -- ["Dereklee0312/base46"] = {
  --   branch = "Nightfly",
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
  ["NvChad/nvim-colorizer.lua"] = {
    override_options = override.colorizer,
  },
  --------------------------------------------------------------------------------------
  -- Removing plugins
  -- ["NvChad/base46"] = false,
}
