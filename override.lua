-- overriding default plugin configs!
local M = {}

M.treesitter = {
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = true,

    -- Automatically install missing parsers when entering buffer
    auto_install = false,

    highlight = {
        enable = true,
        -- disable = { "python" },
    },
    indent = {
        enable = true,
        disable = { "python" },
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
        "c_sharp"
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
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

    -- sql
    "sqls",

    -- javascript
    "typescript-language-server",
  },
}

M.ntree = {
    git = {
        enable = true,
        ignore = false,
    },
    renderer = {
        highlight_git = true,
        icons = {
            show = { git = true}
        }
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
                row = 0.1,
                col = 0.1,
                width = 0.8,
                height = 0.7,
                border = "single",
            },
        }
    }
}
return M
