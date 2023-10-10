-- INFO: fuzzy finder
-- tags: UI, functional
local function config_telescope()
	local actions = require("telescope.actions")
	require("telescope").setup({
		defaults = {
			mappings = {
				i = {
					["<esc>"] = actions.close,
				},
			},
			sorting_strategy = "ascending",
			layout_strategy = "horizontal",
			layout_config = {
				prompt_position = "top",
			},
			file_ignore_patterns = {
				"node_modules",
				"*.o",
				"*.out",
				"#*#",
				"*~"
			}
		},
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown {
					-- even more opts
				}

			}
		}
	})
	require("telescope").load_extension("ui-select")
end

return { {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	tag = "0.1.3",
	dependencies = { 'nvim-lua/plenary.nvim', "nvim-telescope/telescope-ui-select.nvim" },
	config = config_telescope,
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "[f]ind [f]iles"
		},
		{
			"<leader>fF",
			function()
				require("telescope.builtin").find_files({ hidden = true })
			end,
			desc = "[f]ind hidden files"
		},
		{
			"<leader>fr",
			function()
				require("telescope.builtin").git_files()
			end,
			desc = "[f]ind [r]epository files"
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "live grep"
		},
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "[f]ind [b]uffer"
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "[f]ind [h]elp"
		},
		{
			"<leader>sd",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "[s]ymbols [d]ocument"
		},
		{
			"<leader>sw",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "[s]ymbols [w]orkspace"
		},
	}
},
}
