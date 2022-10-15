-- example file i.e lua/custom/init.lua
-- load your options globals, autocmds here or anything .__.
-- you can even override default options here (core/options.lua)

local opt = vim.opt

opt.undofile = false

opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.autoindent = true
opt.smarttab = true
opt.tabstop = 4
opt.softtabstop = 4

opt.relativenumber = true

opt.wrap = false -- No wrap lines
opt.backup = false
opt.scrolloff = 10
opt.sidescrolloff = 20
opt.clipboard = ""
opt.mouse = ""

vim.cmd("noswapfile")

-- vim.g.lazygit_floating_window_scaling_factor = 0.95

-------------------------------------------------------------------------
--                Remove notification for brackets in c                --
-- Link: https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428 --
-------------------------------------------------------------------------
local notify = vim.notify
vim.notify = function(msg, ...)
  if
    msg:match "warning: multiple different client offset_encodings\nclangd: -32602: trying to get preamble for non-added document"
  then
    return
  end

  if msg:match "clangd: -32602: trying to get preamble for non-added document" then
    return
  end
  notify(msg, ...)
end
