local function cmp_compare_snippets_last(entry1, entry2)
	print("hey")
	local kind1 = entry1:get_kind()
	local kind2 = entry2:get_kind()

	if kind1 ~= kind2 then
		local kind_orders = {
			[cmp.lsp.CompletionItemKind.Snippet] = 100,
		}
		local kind1_order = kind_orders[kind1] or 1
		local kind2_order = kind_orders[kind2] or 1
		return kind1_order < kind2_order
	end
end

local function config()
	local lsp = require("lsp-zero")

	lsp.preset("recommended")
	local cmp = require("cmp")
	print("lsp config")
	cmp.setup({
		-- preselect = "none",
		completion = {
			completeopt = "menu,menuone,noinsert,noselect",
		},
		sources = {
			{ name = "path" },
			{ name = "nvim_lsp" },
			{ name = "luasnip", keyword_length = 2 },
		},
		sorting = {
			priority_weight = 2,
			comparators = {
				cmp.config.compare.offset,
				cmp.config.compare.exact,
				cmp.config.compare.score,
				cmp.config.compare.recently_used,
				cmp.config.compare.locality,
		--		cmp.config.compare.sort_text,
				cmp.config.compare.length,
				cmp.config.compare.order,
				cmp_compare_snippets_last,
			},
		},
	})

	lsp.skip_server_setup({ "rust_analyzer" })
	lsp.setup()
	-- HACK: this is a way to ignore errors from rust_analyzer that say the server cancelled the request.
	-- On nvim updates, try commenting this work arround.
	-- Source: https://github.com/neovim/neovim/issues/30985#issuecomment-2447329525
	for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
		local default_diagnostic_handler = vim.lsp.handlers[method]
		vim.lsp.handlers[method] = function(err, result, context, config_inner)
			if err ~= nil and err.code == -32802 then
				return
			end
			return default_diagnostic_handler(err, result, context, config_inner)
		end
	end
end

return {

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		config = config,
		lazy = false,
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{
				"williamboman/mason.nvim",
				build = "MasonUpdate<cr>",
			},
			{ "williamboman/mason-lspconfig.nvim" },
			{ "hrsh7th/nvim-cmp", commit = "b356f2c" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{
				"folke/neodev.nvim",
				config = function()
					require("neodev").setup()
				end,
			},
			{
				"ray-x/lsp_signature.nvim",
				config = function()
					require("lsp_signature").setup({
						hint_prefix = "",
						hint_enable = false,
						doc_lines = 0,
						-- floating_window_off_x = 10,
						handler_opts = {
							border = "none",
						},
						-- floating_window_above_cur_line = false,
						toggle_key = "<M-x>",
					})
				end,
			},
		},
		keys = {
			{
				"<leader>rf",
				function()
					vim.lsp.buf.format()
				end,
				desc = "refactor lsp format",
			},
		},
	},
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "1", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
}
