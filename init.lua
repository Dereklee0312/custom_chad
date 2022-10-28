-- example file i.e lua/custom/init.lua
-- load your options globals, autocmds here or anything .__.
-- you can even override default options here (core/options.lua)

local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd

CMDHEIGHT = 0

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

opt.cmdheight = 0

autocmd({ "RecordingEnter", "RecordingLeave", "CmdlineEnter", "CmdlineLeave" }, {
  callback = function()
    if CMDHEIGHT == 0 then
      opt.cmdheight = 1
      CMDHEIGHT = 1
    else
      opt.cmdheight = 0
      CMDHEIGHT = 0
    end
  end,
})

vim.cmd "noswapfile"
