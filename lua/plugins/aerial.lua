-- INFO: shows symbols outline in a side window
-- tags: UI, IDE


local function config_aerial()
	require("aerial").setup({
		-- optionally use on_attach to set keymaps when aerial has attached to a buffer
		on_attach = function(bufnr)
			-- Jump forwards/backwards with '{' and '}'
			vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
			vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
		end,
		backends = { "treesitter", "lsp", "markdown", "man" },
		-- backends = { "lsp", "treesitter", "markdown", "man" },
		attach_mode = "global",
		layout = {
			width = 50,
		},
		show_guides = true,
		nerd_font = "auto",
		filter_kind = {
			"Class",
			"Constant",
			"Constructor",
			"Enum",
			"EnumMember",
			"Field",
			"Function",
			"Interface",
			"Method",
			"Module",
			"Namespace",
			"Package",
			"Property",
			"Struct",
		},
	})
end

return {
	{
		"stevearc/aerial.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = {
			"onsails/lspkind.nvim",
			"nvim-treesitter/nvim-treesitter",
			-- "nvim-tree/nvim-web-devicons"
		},
		config = config_aerial,
		keys = {
			{
				"<leader>sa",
				function()
					require("aerial").focus()
				end,
				desc = "focus to symbol outline",
			},
			{ "<leader>st", "<cmd>AerialToggle!<CR>", desc = "toggle symbol outline" },
		},
	},
}
