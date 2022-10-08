vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#FF2D00 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#f9fd0b gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#06ff5d gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#4a22e6 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#FF00F3 gui=nocombine]]

vim.opt.list = true

require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
  vim.cmd [[highlight IndentBlanklineContextChar guifg=#06ff5d gui=nocombine]],
  -- char_highlight_list = {
  --     "IndentBlanklineIndent1",
  --     "IndentBlanklineIndent2",
  --     "IndentBlanklineIndent3",
  --     "IndentBlanklineIndent4",
  --     "IndentBlanklineIndent5",
  --     "IndentBlanklineIndent6",
  -- },
}
