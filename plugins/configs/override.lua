-- overriding default plugin configs!
local M = {}

M.treesitter = {
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- Automatically install missing parsers when entering buffer
  auto_install = false,

  highlight = {
    enable = true,
    disable = { "sql" },
  },
  indent = {
    enable = true,
    disable = { "python", "javascript" },
  },
  ensure_installed = {
    "vim",
    "html",
    "css",
    "javascript",
    "json",
    "markdown",
    "c",
    "bash",
    "lua",
    "python",
    "java",
    "c_sharp",
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  autotag = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- c/cpp
    "clangd",
    "csharp-language-server",

    -- python
    "pyright",

    -- Bash
    "bash-language-server",

    -- Webdev
    "typescript-language-server",
    "emmet-ls",
    "css-lsp",

    -- markdown
    "grammarly-languageserver",

    -- FORMATTERS
    "prettier",
    "prettierd",
    "black",
    "csharpier",
  },
}

M.ntree = {
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    debounce_delay = 50,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  git = {
    enable = true,
    ignore = false,
    show_on_dirs = false,
  },
  renderer = {
    highlight_opened_files = "all",
    icons = {
      show = {
        git = true,
      },
    },
  },
  view = {
    adaptive_size = false,
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
}

M.nvterm = {
  terminals = {
    type_opts = {
      float = {
        relative = "editor",
        -- row = 0.1,
        -- col = 0.1,
        -- width = 0.8,
        -- height = 0.7,
        -- border = "single",
        row = 0.05,
        col = 0.05,
        width = 0.9,
        height = 0.85,
        border = "single",
      },
    },
  },
}

M.colorizer = {
  user_default_options = {
    css = true,
  },
}

return M
