-- INFO: shows loading status of LSP provider
-- tags: UI, informational
return {
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		config = function()
			require("fidget").setup({
				text = {
					spinner = "dots_bounce",
				},
				window = {
					blend = 0,
				},
			})
		end,
	},
}
