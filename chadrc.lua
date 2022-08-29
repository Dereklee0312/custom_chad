-- Just an example, supposed to be placed in /lua/custom/

local M = {}

local override = require "custom.override"

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "palenight",
  transparency = "true",
}

M.plugins = {
  user = require "custom.plugins",
  override = {
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
    ["williamboman/mason.nvim"] = override.mason,
  },
  remove = {
    "NvChad/nvterm",
    "numToStr/Comment.nvim",
  },
}

M.mappings = require "custom.mappings"

return M
