-- overriding default plugin configs!
local M = {}

M.treesitter = {
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = true,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

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
    "sqlls",

    -- javascript
    "typescript-language-server",
  },
}

return M
