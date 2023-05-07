local function lualine_config()
	local theme = require('lualine.themes.sonokai')

	theme.normal.a.bg = '#9fa0e1'
	require('lualine').setup {
		options = {
			icons_enabled = true,
			theme = theme,
			component_separators = { left = ' ', right = ' ' },
			section_separators = { left = ' ', right = ' ' },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			}
		},
		sections = {
			lualine_a = { 'mode' },
			lualine_b = { 'branch', 'diff', 'diagnostics' },
			lualine_c = { { 'filename', file_status = true, path = 1 } },
			lualine_x = { 'progress' },
			lualine_y = { 'filetype' },
			lualine_z = { 'location' }
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { 'filename' },
			lualine_x = { 'location' },
			lualine_y = {},
			lualine_z = {}
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {}
	}
end

return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { { "kyazdani42/nvim-web-devicons" } },
		config = lualine_config
	},
	{
		"j-hui/fidget.nvim",
		lazy = true,
		config = function()
			require("fidget").setup({
				text = {
					spinner = "dots_bounce",
				},
				window = {
					blend = 0,
				},
			})
		end
	},
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({})
		end
	},
	{
		"simrat39/symbols-outline.nvim",
		config = function ()
			require("symbols-outline").setup()
		end,
		keys = {
			{ "<leader>st", ":SymbolsOutline<cr>", desc = "symbol tree" }
		}
	}
}
