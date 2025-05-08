return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato"
			})
			vim.cmd([[colorscheme catppuccin]])
		end
	},
	{
		"eriizu/gruvbox-material",
		branch = "custom_v2",
		lazy = false,
		enabled = false,
		config = function()
			vim.g.gruvbox_material_background = "medium"
			vim.g.gruvbox_material_foreground = "material"
			vim.g.gruvbox_material_transparent_background = 1
			vim.g.gruvbox_material_better_performance = 1
			vim.g.gruvbox_material_dim_inactive_windows = 0
			vim.g.gruvbox_material_enable_italic = 1
			vim.g.gruvbox_material_enable_bold = 0
			vim.opt.termguicolors = true
			vim.cmd([[colorscheme gruvbox-material]])
		end
	},
	{
		"sainnhe/sonokai",
		lazy = false,
		enabled = false,
		config = function()
			vim.g.sonokai_style = "espresso"
			vim.g.sonokai_transparent_background = 2
			vim.g.sonokai_better_performance = 1
			vim.g.sonokai_dim_inactive_windows = 0
			vim.opt.termguicolors = true
			vim.cmd([[colorscheme sonokai]])
		end
	}
}
