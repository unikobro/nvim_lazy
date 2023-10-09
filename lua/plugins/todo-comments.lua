-- INFO: highlights comments that have certain prefixes (INFO, FIX, BUG, TODO, etc.)
-- tags: UI
return {
	{
		"folke/todo-comments.nvim",
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({})
		end,
	},
}
