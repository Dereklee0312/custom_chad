local M = {}

local config = {
	statusline = {
		separator_style = "round",
		overriden_modules = nil,
	},
	tabufline = {
		enabled = true,
		lazyload = true,
		overriden_modules = function()
			return require("custom.ui.tabufline.override")
		end
	}
}

M.statusline = function()
	return require("custom.ui.statusline").run()
end

M.tabufline = function()
	return require("nvchad_ui.tabufline").run(config.tabufline)
end

M.winbar = function()
	return require("custom.ui.winbar").run()
end

M.setup = function()
	-- lazyload tabufline
	require("nvchad_ui.tabufline.lazyload")(config.tabufline)
	vim.opt.statusline = "%{%v:lua.require('custom.ui').statusline()%}"
	-- vim.opt.winbar = "%{%v:lua.require('custom.ui').winbar()%}"
end

return M
