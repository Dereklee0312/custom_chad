-- n, v, i, t = mode names

local M = {}

M.general = {
  n = {
    ["<ESC>"] = { "<cmd> noh <CR>", "no highlight" },

    -- save
    ["<C-s>"] = { "<cmd> w <CR>", "save file" },

    -- Copy all
    ["<C-c>"] = { "<cmd> %y+ <CR>", "copy whole file" },

    -- select all
    ["<C-a>"] = {"gg<S-v>G", "select all"},

    -- Copy whole line without the newline
    ["YY"] = {"^y$", "Copy whole line without newline"},

    -- New tab
    ["TT"] = { ":tabedit ", "Create new tab"},

    -- Panes
    ["ss"] = { ":split<Return><C-w>w", "Split window horizontally"},
    ["sv"] = { ":vsplit<Return><C-w>w", "Split window vertically"},

    ["W"] = {":q<Return>", "Close window"},
    ["<A-W>"] = {":wq <CR>", "Save and close"},
    -- Changing window focus
    ["sh"] = { "<C-w>h", "window left" },
    ["sl"] = { "<C-w>l", "window right" },
    ["sj"] = { "<C-w>j", "window down" },
    ["sk"] = { "<C-w>k", "window up" },
    -- Opening lazy git
    ["<leader>gg"] = {":LazyGit<CR>", "Open lazy git in neovim"},
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<A-r>"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<A-f>"] = { "<cmd> Telescope live_grep <CR>", "live grep" },

    -- Diagnostics
        ["<A-e>"] = {
            function()
                require "plugins.configs.telescope"
                require "custom.plugins.configs.telescope"

                require("telescope.builtin").diagnostics({
                    no_unlisted = false,
                    no_sign = true,
                    line_width = 50,
                })
            end,
        "Show diagnostics with telescope"
        },
  },
}

M.lspconfig = {
    plugin = true,

    n = {
        -- Diagnostics
        ["<A-d>"] = {
            function()
                vim.diagnostic.config({virtual_text = false})
            end,
            "Hide diagnostics"
        },

        ["<A-E>"] = {
            function()
                vim.diagnostic.config({virtual_text = true})
            end,
            "Show in-line diagnostics"
        },

        -- JUMPING
        ["gr"] = {":Telescope lsp_references <CR>", "lsp references"},
        ["gi"] = {":Telescope lsp_implementations <CR>", "lsp implementation"},
        ["gd"] = {":Telescope lsp_definitions <CR>", "lsp definition"},
        ["<leader>D"] = {":Telescope lsp_type_definitions <CR>", "lsp type definition"},
    }
}

return M
