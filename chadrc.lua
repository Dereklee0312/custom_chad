-- Just an example, supposed to be placed in /lua/custom/

local M = {}

local highlights = require "custom.ui.highlights"
local themes = require "custom.ui.themes"
-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "tokyonight",
  theme_toggle = { "tokyonight", "solarized_dark" },
  transparency = "true",
  hl_override = highlights.override,
  hl_add = highlights.add,
  changed_themes = themes,
}

M.plugins = require "custom.plugins"

M.mappings = require "custom.mappings"

return M
