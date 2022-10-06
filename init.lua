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

vim.cmd "noswapfile"

-- vim.g.lazygit_floating_window_scaling_factor = 0.95
