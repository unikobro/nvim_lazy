local function lualine_config()
	local theme = require("lualine.themes.sonokai")

	theme.normal.a.bg = "#9fa0e1"
	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = theme,
			component_separators = { left = " ", right = " " },
			section_separators = { left = " ", right = " " },
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
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { { "filename", file_status = true, path = 1 } },
			lualine_x = { "aerial", "progress" },
			lualine_y = { "filetype" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	})
end

return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
			"sainnhe/sonokai",
		},
		config = lualine_config,
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
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 2000
			require("which-key").setup({})
		end,
	},
--	{
--		"folke/todo-comments.nvim",
--		dependencies = { "nvim-lua/plenary.nvim" },
--		config = function()
--			require("todo-comments").setup({})
--		end,
--		enable = false
--	},
	{
		"simrat39/symbols-outline.nvim",
		enable = false,
		config = function()
			require("symbols-outline").setup()
		end,
		-- keys = {
		-- { "<leader>st", ":SymbolsOutline<cr>", desc = "symbol tree" }
		-- }
	},
	{
		"stevearc/aerial.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = {
			"onsails/lspkind.nvim",
			"nvim-treesitter/nvim-treesitter",
			-- "nvim-tree/nvim-web-devicons"
		},
		config = function()
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
		end,
		keys = {
			{
				"<leader>sa",
				function()
					require("aerial").focus()
				end,
				desc = "symbol tree",
			},
			{ "<leader>st", "<cmd>AerialToggle!<CR>", desc = "symbol tree" },
		},
	},
	{
		"goolord/alpha-nvim",
		lazy = false,
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local startify = require("alpha.themes.startify")
			startify.section.header.val = {
				[[                                    (_)                                      ]],
				[[ _ __ ___   ___  _____      ____   ___ _ __ ___       |\      _,,,---,,_     ]],
				[[| '_ ` _ \ / _ \/ _ \ \ /\ / /\ \ / / | '_ ` _ \  Z zz /,`.-'`'    -.  ;-;;,_]],
				[[| | | | | |  __/ (_) \ V  V /  \ V /| | | | | | |    |,4-  ) )-,_. ,\ (  `'-']],
				[[|_| |_| |_|\___|\___/ \_/\_/    \_/ |_|_| |_| |_|   '---''(_/--'  `-'\_)     ]],
			}
			require("alpha").setup(startify.config)
		end,
		keys = {
			{ "<leader>a", ":Alpha<cr>", desc = "dashboard" },
		},
	},
	{
		{
			"stevearc/stickybuf.nvim",
			opts = {},
			config = function()
				require("stickybuf").setup({
					-- This function is run on BufEnter to determine pinning should be activated
					get_auto_pin = function(bufnr)
						-- You can return "bufnr", "buftype", "filetype", or a custom function to set how the window will be pinned
						-- The function below encompasses the default logic. Inspect the source to see what it does.
						return require("stickybuf").should_auto_pin(bufnr)
					end,
				})
			end,
		},
	},
}
