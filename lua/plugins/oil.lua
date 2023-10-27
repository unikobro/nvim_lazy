return {
	'stevearc/oil.nvim',
	lazy = false,
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"<leader>-",
			function()
				vim.cmd("Oil")
			end,
			desc = "Oil open parent dir"
		}
	}
}
