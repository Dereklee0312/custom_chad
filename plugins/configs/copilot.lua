-- Use this table to disable/enable filetypes
vim.g.copilot_filetypes = {
  xml = false,
}

-- Since most are enabled by default you can turn them off
-- Using this table and only enable for a few filetypes
-- vim.g.copilot_filetypes = {
--     ["*"] = false,
--     python = true,
-- }

vim.cmd [[imap <silent><script><expr> <C-g> copilot#Accept("\<CR>")]]
vim.g.copilot_no_tab_map = true
