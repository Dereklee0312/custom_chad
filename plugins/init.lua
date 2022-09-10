-- custom/plugins/init.lua return table of plugins

local override = require "custom.override"

return {
----------------------------------------------------------------------------------------
    -- Installing new plugins
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

    -- Reconfigured blankline for context highlight indenting and rainbow indents
    ["lukas-reineke/indent-blankline.nvim"] = {
        config = function()
            require "custom.plugins.configs.blankline"
        end,
    },

    -- Holds context of current line
    ["nvim-treesitter/nvim-treesitter-context"] = {
        config = function()
            require "custom.plugins.configs.tscontext"
        end,
    },

    ["kdheepak/lazygit.nvim"] = {},
--------------------------------------------------------------------------------------
    -- Overriding configs
    ["nvim-treesitter/nvim-treesitter"] = {
        override_options = override.treesitter,
    },
    ["williamboman/mason.nvim"] = {
        override_options = override.mason,
    },
    ["NvChad/ui"] = {
        override_options = override.stat
    },

--------------------------------------------------------------------------------------
    -- Removing plugins
    ["NvChad/nvterm"] = false,
    ["numToStr/Comment.nvim"] = false,
}
