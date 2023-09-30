local function dap_config()
	local dap, dapui = require("dap"), require("dapui")
	local home_path = vim.fn.getenv("HOME")

	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end

	-- NOTE: from: https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(via--codelldb)
	-- downloaded codelldb vsix from https://github.com/vadimcn/codelldb/releases and extracted in
	-- .local/share/nvim
	dap.adapters.codelldb = {
		type = "server",
		port = "${port}",
		executable = {
			-- WARN: CHANGE THIS to your path!
			command = home_path .. "/.local/share/nvim/codelldb-1.10.0/extension/adapter/codelldb",
			args = { "--port", "${port}" },

			-- FIX: On windows you may have to uncomment this:
			-- detached = false,
		},
	}
	dap.configurations.cpp = {
		{
			name = "Launch file",
			type = "codelldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
		},
	}
	dap.configurations.c = dap.configurations.cpp

end

local function dap_ui_config()
	local dapui = require("dapui")
	local dap = require("dap")
	local api = vim.api
	local keymap_restore = {}
	dap.listeners.after["event_initialized"]["me"] = function()
		for _, buf in pairs(api.nvim_list_bufs()) do
			local keymaps = api.nvim_buf_get_keymap(buf, "n")
			for _, keymap in pairs(keymaps) do
				if keymap.lhs == "K" then
					table.insert(keymap_restore, keymap)
					api.nvim_buf_del_keymap(buf, "n", "K")
				end
			end
		end
		api.nvim_set_keymap("n", "K", '<Cmd>lua require("dap.ui.widgets").hover()<CR>', { silent = true })
		--    api.nvim_set_keymap("n", "K", require("dap.ui.widgets").hover, { silent = true })
		dapui.open()
	end

	dap.listeners.after["event_terminated"]["me"] = function()
		-- dapui.close()
		for _, keymap in pairs(keymap_restore) do
			api.nvim_buf_set_keymap(keymap.buffer, keymap.mode, keymap.lhs, keymap.rhs, { silent = keymap.silent == 1 })
		end
		keymap_restore = {}
	end
	dapui.setup()
end

return {
	{
		"mfussenegger/nvim-dap",
		config = dap_config,
		lazy = true,
		keys = {
			{
				"<leader>dc", function()
					require("dap").continue()
				end, desc = "[d]ebug [c]ontinue"
			},
			{
				"<leader>dl", function()
					require("dap").step_over()
				end, desc = "[d]ebug step over"
			},
			{
				"<leader>dj", function()
					require("dap").step_into()
				end, desc = "[d]ebug step into"
			},
			{
				"<leader>dk", function()
					require("dap").step_out()
				end, desc = "[d]ebug step out"
			},
			{
				"<leader>db", function()
					require("dap").toggle_breakpoint()
				end, desc = "[d]ebug toggle [b]reakpoint"
			},
			{
				"<leader>dB", function()
					require("dap").set_breakpoint()
				end, desc = "[d]ebug set [B]reakpoint"
			},
			{
				"<leader>de", function()
					require("dap").repl.open()
				end, desc = "[d]ebug open repl"
			},
			{
				"<leader>dr", function()
					require("dap").run_last()
				end, desc = "[d]ebug [r]un last"
			},
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		config = dap_ui_config,
		lazy = true,
		keys = {
			{
				"<leader>du", function()
					require("dapui").toggle()
				end, desc = "debug dapui toogle"
			},
			{
				"<leader>dh", function()
					require("dap.ui.widgets").hover()
				end, desc = "[d]ebug [h]over"
			},
			{
				"<leader>dp", function()
					require("dap.ui.widgets").previous()
				end, desc = "[d]ebug [p]review"
			},
			{
				"<leader>df", function()
					local widgets = require("dap.ui.widgets")
					widgets.centered_float(widgets.frames)
				end, desc = "[d]ebug [f]rames"
			},
			{
				"<leader>ds", function()
					local widgets = require("dap.ui.widgets")
					widgets.centered_float(widgets.scopes)
				end, desc = "[d]ebug [s]copes"
			},
		}
	}
}
