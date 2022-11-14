local actions = require "telescope.actions"
local fb_actions = require("telescope").extensions.file_browser.actions
-- local builtin = require('telescope.builtin')
local present, telescope = pcall(require, "telescope")

if not present then
  return
end

vim.g.theme_switcher_loaded = true

require("base46").load_highlight "telescope"

local options = {
  defaults = {
    initial_mode = "normal",
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default + actions.center,
      },
    },
  },
  pickers = {
    live_grep = {
      initial_mode = "insert",
    },
  },
}
-- check for any override
-- options = require("core.utils").load_override(options, "nvim-telescope/telescope.nvim")
telescope.setup(options)

-- load extensions
telescope.load_extension "file_browser"
