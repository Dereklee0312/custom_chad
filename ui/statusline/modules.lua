local M = {}

local fn = vim.fn
local api = vim.api

local MINIMUM_SIZE = 90

local modes = {
    ["n"] = { "NORMAL", "St_NormalMode" },
    ["niI"] = { "NORMAL i", "St_NormalMode" },
    ["niR"] = { "NORMAL r", "St_NormalMode" },
    ["niV"] = { "NORMAL v", "St_NormalMode" },
    ["no"] = { "N-PENDING", "St_NormalMode" },
    ["i"] = { "INSERT", "St_InsertMode" },
    ["ic"] = { "INSERT (completion)", "St_InsertMode" },
    ["ix"] = { "INSERT completion", "St_InsertMode" },
    ["t"] = { "TERMINAL", "St_TerminalMode" },
    ["nt"] = { "NTERMINAL", "St_NTerminalMode" },
    ["v"] = { "VISUAL", "St_VisualMode" },
    ["V"] = { "V-LINE", "St_VisualMode" },
    ["Vs"] = { "V-LINE (Ctrl O)", "St_VisualMode" },
    [""] = { "V-BLOCK", "St_VisualMode" },
    ["R"] = { "REPLACE", "St_ReplaceMode" },
    ["Rv"] = { "V-REPLACE", "St_ReplaceMode" },
    ["s"] = { "SELECT", "St_SelectMode" },
    ["S"] = { "S-LINE", "St_SelectMode" },
    [""] = { "S-BLOCK", "St_SelectMode" },
    ["c"] = { "COMMAND", "St_CommandMode" },
    ["cv"] = { "COMMAND", "St_CommandMode" },
    ["ce"] = { "COMMAND", "St_CommandMode" },
    ["r"] = { "PROMPT", "St_ConfirmMode" },
    ["rm"] = { "MORE", "St_ConfirmMode" },
    ["r?"] = { "CONFIRM", "St_ConfirmMode" },
    ["!"] = { "SHELL", "St_TerminalMode" },
}

M.invi_sep = "%#StInviSep# "
M.tree_padding = function()
	if vim.o.columns < MINIMUM_SIZE then return "" end
	for _, win in pairs(api.nvim_tabpage_list_wins(0)) do
		if vim.bo[api.nvim_win_get_buf(win)].ft == "NvimTree" then
			return "%#Normal#" .. string.rep(" ", math.min(30, api.nvim_win_get_width(win) + 1), "")
		end
	end
	return ""
end

M.mode = function()
	local m = api.nvim_get_mode().mode
	local current_mode = "%#" .. modes[m][2] .. "# " .. modes[m][1]
	local left_sep = "%#" .. modes[m][2] .. "Sep#"
	local right_sep = "%#" .. modes[m][2] .. "Sep#"
	return left_sep .. current_mode .. right_sep
end

M.cwd = function()
	local left_sep = "%#StCwdSep#"
	local dir_name = "%#StCwd# " .. fn.fnamemodify(fn.getcwd(), ":t")
	return (vim.o.columns > MINIMUM_SIZE) and left_sep .. dir_name or ""
end

M.file_name = function()
	if fn.expand("%") == "" then
		return (vim.o.columns > MINIMUM_SIZE) and "%#StCwdSep#" or ""
	end
	local filename = fn.expand("%:t")
	local extension = fn.expand("%:e")
	local icon = require("nvim-web-devicons").get_icon(filename, extension)
	icon = (icon ~= nil) and icon or ""
	local left_sep = (vim.o.columns > MINIMUM_SIZE) and "%#StDirFileSep#" or "%#StFileSep#"
	local right_sep = "%#StFileSep#"
	local file_info = "%#StFile# " .. icon .. " " .. filename
	return left_sep .. file_info .. right_sep
end

M.git = function()
	if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
		return ""
	end
	local git_status = vim.b.gitsigns_status_dict
	local branch = "%#StGitBranch#  " .. git_status.head
	local added = (git_status.added and git_status.added ~= 0)
			and ("%#StGitAdded#  " .. git_status.added) or ""
	local changed = (git_status.changed and git_status.changed ~= 0)
			and ("%#StGitChanged#  " .. git_status.changed) or ""
	local removed = (git_status.removed and git_status.removed ~= 0)
			and ("%#StGitRemoved#  " .. git_status.removed) or ""
	return branch .. added .. changed .. removed
end

M.session_status = function()
	return vim.g.persisting == true
			and "%#StSessionStatus#  "
			or "%#StSessionStatus#  "
end

M.lsp_diagnostics = function()
	local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
	local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
	local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	errors = (errors and errors > 0) and ("%#StLSPErrors# " .. errors .. " ") or ""
	warnings = (warnings and warnings > 0) and ("%#StLSPWarnings# " .. warnings .. " ") or ""
	hints = (hints and hints > 0) and ("%#StLSPHints# " .. hints .. " ") or ""
	info = (info and info > 0) and ("%#StLSPInfo# " .. info .. " ") or ""
	return errors .. warnings .. hints .. info
end

M.lsp_clients = function()
	local clients = {}
	for _, client in pairs(vim.lsp.get_active_clients()) do
		if client.attached_buffers[api.nvim_get_current_buf()] then
			clients[#clients + 1] = client.name
		end
	end
	local name = table.concat(clients, ",")
	return (vim.o.columns > MINIMUM_SIZE)
			and "%#StLSPClient#" .. name .. " "
			or "%#StLSPClient#  LSP "
end

-- M.position = function()
-- 	if fn.expand("%") == "" then
-- 		return ""
-- 	end
-- 	local left_sep = "%#StPositionSep#"
-- 	local right_sep = "%#StPositionSep#"
-- 	local line, col = unpack(api.nvim_win_get_cursor(0))
-- 	local line_text = api.nvim_get_current_line()
-- 	-- Get the text before the cursor in the current line
-- 	local before_cursor = line_text:sub(1, col)
-- 	-- Replace tabs with the equivalent amount of spaces according to the value of 'tabstop'
-- 	before_cursor = before_cursor:gsub("\t", string.rep(" ", vim.bo.tabstop))
-- 	-- Turn col from byteindex to column number and make it start from 1
-- 	col = vim.str_utfindex(before_cursor) + 1
--
-- 	local cursor_position = "%#StPosition#" .. string.format("%-3d:%3d", line, col)
-- 	return left_sep .. cursor_position .. right_sep
-- end

M.position = function()
  local left_sep = "%#StPositionSep#"
  local right_sep = "%#StPositionSep#"
  local line, col = unpack(api.nvim_win_get_cursor(0))
  local line_text = api.nvim_get_current_line()
  -- Get the text before the cursor in the current line
  local before_cursor = line_text:sub(1, col)
  -- Replace tabs with the equivalent amount of spaces according to the value of 'tabstop'
  before_cursor = before_cursor:gsub("\t", string.rep(" ", vim.bo.tabstop))
  -- Turn col from byteindex to column number and make it start from 1
  col = vim.str_utfindex(before_cursor) + 1

  local cursor_position = "%#StPosition#" .. string.format("%-3d:%3d", line, col)
  return left_sep .. cursor_position .. right_sep
end

return M
