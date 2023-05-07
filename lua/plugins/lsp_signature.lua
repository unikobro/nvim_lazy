return { {
	"ray-x/lsp_signature.nvim",
	config = function()
		require("lsp_signature").setup({
			hint_prefix = "sig: ",
			hint_enable = false,
			doc_lines = 0,
			floating_window_off_x = 0,
			handler_opts = {
				border = "rounded",
			},
		})
	end
}}
