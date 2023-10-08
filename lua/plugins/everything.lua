return {
	--{ "folke/neoconf.nvim", cmd = "Neoconf" },
	{
		"sainnhe/sonokai",
		lazy = false,
		config = function()
			vim.g.sonokai_style = "espresso"
			vim.g.sonokai_transparent_background = 2
			vim.g.sonokai_better_performance = 1
			vim.g.sonokai_dim_inactive_windows = 0
			vim.opt.termguicolors = true
			vim.cmd([[colorscheme sonokai]])
		end
	},
	"rstacruz/vim-closer",
}
