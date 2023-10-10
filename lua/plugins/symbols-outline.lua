-- WARN: disabled, replaced by aerial.nvim

return {
	{
		"simrat39/symbols-outline.nvim",
		enable = false,
		config = function()
			require("symbols-outline").setup()
		end,
		--keys = {
			--{ "<leader>st", ":SymbolsOutline<cr>", desc = "symbol tree" }
		--}
	}
}
