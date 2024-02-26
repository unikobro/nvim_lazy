-- INFO: highlights comments that have certain prefixes (INFO, FIX, BUG, TODO, etc.)
-- tags: UI
return {
	{
		"folke/todo-comments.nvim",
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			colors = {
				error = { "DiagnosticError", "ErrorMsg", "#ea6962" },
				warning = { "DiagnosticWarn", "WarningMsg", "#d8a657" },
				info = { "DiagnosticInfo", "#7daea3" },
				hint = { "DiagnosticHint", "#89b482" },
				default = { "Identifier", "#d3869b" },
				test = { "Identifier", "#d3869b" }
			},
		},
		-- config = function()
		-- 	require("todo-comments").setup({})
		-- end,
	},
}
