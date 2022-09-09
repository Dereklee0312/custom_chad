-- example file i.e lua/custom/init.lua
-- load your options globals, autocmds here or anything .__.
-- you can even override default options here (core/options.lua)


local opt = vim.opt

opt.undofile = false

opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4

opt.relativenumber = true

vim.opt.wrap = false -- No wrap lines
vim.cmd('noswapfile')
vim.opt.backup = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 20
