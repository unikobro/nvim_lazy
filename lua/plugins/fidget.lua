-- INFO: shows loading status of LSP provider
-- tags: UI, informational
return {
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {
			progress = {
				display = {
					progress_icon = {"dots_bounce"},
					--progress_icon = { pattern = "dots_bounce", period = 0.1 }
					group_style = "Keyword",
					icon_style = "Keyword",
					progress_style = "Comment"
				},
			},
			notification = {
				window = {
					winblend = 0
				}
			}
		},
	},
	-- {
	-- 	"j-hui/fidget.nvim",
	-- 	tag = "legacy",
	-- 	event = "LspAttach",
	-- 	config = function()
	-- 		require("fidget").setup({
	-- 			text = {
	-- 				spinner = "dots_bounce",
	-- 			},
	-- 			window = {
	-- 				blend = 0,
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
