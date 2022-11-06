return {
	run = function()
		local modules = require("custom.ui.statusline.modules")
		return table.concat({
			modules.tree_padding(),
			modules.mode(),
			modules.invi_sep,
			modules.cwd(),
			modules.file_name(),
			modules.git(),
			"%=",
			modules.lsp_diagnostics(),
			modules.lsp_clients(),
			modules.session_status(),
			modules.position(),
		})
	end
}
