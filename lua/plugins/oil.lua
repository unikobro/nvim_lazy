return {
	'stevearc/oil.nvim',
	lazy = false,
	opts = {
		view_options = {
			sort = {
				{ "name", "asc" }
			}
		}
	},
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
