-- INFO: syntax parser for highlighting and processing
-- tags: IDE

local function config_ts()
	require("nvim-treesitter.configs").setup({
		-- A list of parser names, or "all" (the four listed parsers should always be installed)
		ensure_installed = { "c", "lua", "vim", "rust", "javascript", "typescript", "html" },

		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = false,

		-- Automatically install missing parsers when entering buffer
		-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
		auto_install = true,

		ignore_install = { "sql" },
		indent = { enable = false },
		highlight = {
			enable = true,

			-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
			disable = function(lang, buf)
				if (lang == "gitcommit") then
					return true
				end
				if (lang == "sql") then
					return true
				end
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then return true end
			end,

			-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
			-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
			-- Using this option may slow down your editor, and you may see some duplicate highlights.
			-- Instead of true it can also be a list of languages
			additional_vim_regex_highlighting = false,
		},
		modules = {}
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	event = { "BufReadPost", "BufNewFile" },
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
	config = config_ts
}
