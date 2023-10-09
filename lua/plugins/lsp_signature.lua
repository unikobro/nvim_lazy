-- INFO: shows signature for current function call
-- tags: UI, IDE, LSP
return { {
	"ray-x/lsp_signature.nvim",
	lazy= false,
	--event = "LspAttach",
	config = function()
		require("lsp_signature").setup({
			hint_prefix = "",
			hint_enable = false,
			doc_lines = 0,
			floating_window_off_x = 0,
--			handler_opts = {
--				border = "rounded",
--			},
			floating_window_above_cur_line = false,
		})
	end
} }
