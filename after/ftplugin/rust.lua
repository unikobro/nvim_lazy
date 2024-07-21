vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])

local bufnr = vim.api.nvim_get_current_buf()
local function code_actions()
	vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
end
local function debug_action()
	vim.cmd.RustLsp("debuggables") -- supports rust-analyzer's grouping
end
vim.keymap.set("n", "<F4>", code_actions, { silent = true, buffer = bufnr })
vim.keymap.set("n", "<F5>", debug_action, { silent = true, buffer = bufnr })
