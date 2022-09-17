local actions = require('telescope.actions')
-- local builtin = require('telescope.builtin')
local present, telescope = pcall(require, "telescope")

if not present then
    return
end

vim.g.theme_switcher_loaded = true

require("base46").load_highlight "telescope"

local options = {
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default + actions.center
            },
        },
        extensions_list = { "themes", "terms" },
        -- builtin.diagnostics({
        --     no_sign = true,
        --     line_width = 200,
        --     bufnr = 0,
        -- })
    },
}
-- check for any override
-- options = require("core.utils").load_override(options, "nvim-telescope/telescope.nvim")
telescope.setup(options)

-- load extensions
pcall(function()
    for _, ext in ipairs(options.extensions_list) do
        telescope.load_extension(ext)
    end
end)

-- builtin.diagnostics({
--     no_sign = true,
--     line_width = 200,
--     bufnr = 0,
-- })
