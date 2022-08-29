-- overriding default plugin configs!
local M = {}

M.treesitter = {
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
  },
}

return M
