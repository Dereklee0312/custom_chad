-- Just an example, supposed to be placed in /lua/custom/

local M = {}

local highlights = require "custom.ui.highlights"
-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "dark_horizon",
  theme_toggle = { "solarized_dark", "dark_horizon" },
  -- theme_toggle = { "ayu-light", "catppuccin_latte" },
  -- transparency = "true",
  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = require "custom.plugins"

M.mappings = require "custom.mappings"

return M
