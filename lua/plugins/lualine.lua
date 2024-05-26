-- INFO: custom status line, tab line, window title bar
-- tags: UI, status

local function is_width_more_than(target_width)
	return function()
		local win_width = vim.fn.winwidth(0)
		if win_width > target_width then
			return true
		end
		return false
	end
end

local function lualine_config()
	-- local theme = require("lualine.themes.sonokai")
	local theme = require("lualine.themes.gruvbox-material")

	-- theme.normal.a.bg = "#9fa0e1"
	theme.normal.a.bg = "#d3869b"
	theme.command.a.bg = "#d8a657"
	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = theme,
			component_separators = { left = " ", right = " " },
			section_separators = { left = " ", right = " " },
			disabled_filetypes = {
				statusline = { "alpha", "aerial" },
				winbar = { "alpha", "aerial" },
			},
			ignore_focus = {},
			always_divide_middle = false,
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				{
					"branch",
					cond = is_width_more_than(120)
				},
				{
					"diff",
					cond = is_width_more_than(110)
				}
			},
			lualine_c = {
				{
					"filename",
					file_status = true,
					path = 1
				},
				{
					"diagnostics",
					symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' }
				}
			},
			lualine_x = {
				{
					"aerial",
					cond = is_width_more_than(90)

				}
			},
			lualine_y = {
				{
					"progress",
				}
			},
			lualine_z = {
				{
					"location",
				}
			},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {
				{ "filename", file_status = true, path = 1 },
				{
					"diagnostics",
					symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' }
				}
			},
			lualine_x = { "aerial", "progress", "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {
			lualine_a = { {
				"tabs",
				mode = 2,
				cond = function()
					return vim.fn.tabpagenr('$') > 1
				end,
				draw_empty = false,
				max_length = function() return vim.go.columns end,
			} },
		},
		extensions = { 'aerial', 'lazy', 'nvim-dap-ui' },
	})
	vim.cmd("set showtabline=1")
end

return {
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			-- "sainnhe/sonokai",
		},
		config = lualine_config,
	},
}
