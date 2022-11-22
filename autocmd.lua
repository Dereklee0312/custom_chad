-- File containing all autocommands

local ag = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd
local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

autocmd({ "RecordingEnter", "RecordingLeave", "CmdlineEnter", "CmdlineLeave" }, {
  callback = function()
    if vim.g.CMDHEIGHT == 0 then
      opt.cmdheight = 1
      vim.g.CMDHEIGHT = 1
    else
      opt.cmdheight = 0
      vim.g.CMDHEIGHT = 0
    end
  end,
})

---Highlight yanked text
au("TextYankPost", {
  group = ag("yank_highlight", {}),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 300 }
  end,
})

-- Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
vim.api.nvim_exec(
  [[
autocmd BufWritePre * let currPos = getpos(".")
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e
autocmd BufWritePre * cal cursor(currPos[1], currPos[2])
]],
  false
)

-- Blinking Cursor
vim.cmd [[
		:set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
		  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
		  \,sm:block-blinkwait175-blinkoff150-blinkon175
]]
