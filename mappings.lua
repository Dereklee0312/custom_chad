-- n, v, i, t = mode names

local M = {}
Mouse = 0
Copilot = 0

M.general = {
  n = {
    ["<ESC>"] = { "<cmd> noh <CR>", "no highlight" },
    ["<leader>n"] = { "<cmd> set nu! rnu! <CR>", "Remove all line numbers" },

    -- save
    ["<C-s>"] = { "<cmd> w <CR>", "save file" },

    -- Yanking
    ["<C-c>"] = { "<cmd> %y+ <CR>", "copy whole file" },
    ["<C-a>"] = { "gg<S-v>G", "select all" },
    ["YY"] = { "^y$", "Copy whole line without newline" },
    ["<leader>y"] = { '"+y', "Copy to system clipboard" },

    -- New tab
    ["TT"] = { ":tabedit ", "Create new tab" },

    -- Panes
    ["ss"] = { ":split<Return><C-w>w", "Split window horizontally" },
    ["sv"] = { ":vsplit<Return><C-w>w", "Split window vertically" },

    ["W"] = { ":q<CR><CR>", "Close window" },
    ["<A-W>"] = { ":wq <CR>", "Save and close" },

    -- Changing window focus
    ["sh"] = { "<C-w>h", "window left" },
    ["sl"] = { "<C-w>l", "window right" },
    ["sj"] = { "<C-w>j", "window down" },
    ["sk"] = { "<C-w>k", "window up" },

    -- Do not yank with x/d
    ["x"] = { '"_x', "Do not yank with x" },
    ["D"] = { '"_d', "Do not yank with D" },
    ["DD"] = { '"_dd', "Do not yank with DD" },

    -- Increment/Decrement
    ["+"] = { "<C-a>", "Increment" },
    ["-"] = { "<C-x>", "Decrement" },

    -- Format
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "lsp formatting",
    },
    -- Toggle copilot
    ["<leader>cp"] = {
      function()
        if Copilot == 0 then
          vim.g.copilot_enabled = true
          print "Copilot Enabled"
          Copilot = 1
        else
          vim.g.copilot_enabled = false
          print "Copilot Disabled"
          Copilot = 0
        end
      end,
    },

    -- Toggling between mouse modes
    ["<leader>m"] = {
      function()
        if Mouse == 0 then
          vim.opt.mouse = ""
          vim.cmd "set nu! rnu!"
          Mouse = 1
        else
          vim.opt.mouse = "a"
          vim.cmd "set nu! rnu!"
          Mouse = 0
        end
      end,
    },
  },

  v = {
    ["<leader>y"] = { '"+y', "Copy to system clipboard" },
    ["D"] = { '"_d', "Do not yank with D" },
  },

  t = {
    ["<C-h>"] = { "<C-\\><C-n><C-w>h", "Changing focus from terminal pane to left" },
    ["<C-l>"] = { "<C-\\><C-n><C-w>l", "Changing focus from terminal pane to right" },
    ["<C-j>"] = { "<C-\\><C-n><C-w>j", "Changing focus from terminal pane to down" },
    ["<C-k>"] = { "<C-\\><C-n><C-w>k", "Changing focus from terminal pane to up" },

    ["<C-n>"] = { "<C-\\><C-n>", "Change to Normal mode" },
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

        require("telescope.builtin").diagnostics {
          no_unlisted = false,
          no_sign = true,
          line_width = 50,
        }
      end,
      "Show diagnostics with telescope",
    },
    -- Noice telescope
    ["<leader>tn"] = { "<cmd> Telescope noice <CR>", "Opening noice in telescope" },
  },
}

M.lspconfig = {
  plugin = true,

  n = {
    -- Diagnostics
    ["<A-d>"] = {
      function()
        vim.diagnostic.config { virtual_text = false }
      end,
      "Hide diagnostics",
    },

    ["<A-E>"] = {
      function()
        vim.diagnostic.config { virtual_text = true }
      end,
      "Show in-line diagnostics",
    },

    -- JUMPING
    ["gr"] = { ":Telescope lsp_references <CR>", "lsp references" },
    ["gi"] = { ":Telescope lsp_implementations <CR>", "lsp implementation" },
    ["gd"] = { ":Telescope lsp_definitions <CR>", "lsp definition" },
    ["<leader>D"] = { ":Telescope lsp_type_definitions <CR>", "lsp type definition" },
  },
}

return M
