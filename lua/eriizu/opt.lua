vim.opt.number = true
vim.opt.scrolloff = 5
vim.opt.title = true
vim.opt.breakindent = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.backspace = "indent,eol,start"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = "tab:→ ,nbsp:+,trail:·,extends:→,precedes:←"
vim.opt.wildignore:append( ".git,.hg,.svn,*.pyc,*.o,*.jpg,*.jpeg,*.png,*.gif,*.zip,*.DS_Store,*/node_modules/*,*/bower_modules/*")
vim.opt.showmode = false
vim.g.mapleader = " "

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})
vim.opt.colorcolumn = "80"

vim.keymap.set("n", "<leader>fd", vim.cmd.Ex, { desc = "explore directories", silent = true })
vim.keymap.set({ "n", "x" }, "cp", '"+y')
vim.keymap.set({ "n", "x" }, "cv", '"+p')
vim.keymap.set({ "n", "x" }, "<leader>bn", ":bNext<enter>")
vim.keymap.set({ "n", "x" }, "<leader>bp", ":bprevious<enter>")

vim.keymap.set("t", "<C-W>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>tc", ":tabnew<cr>", { desc = "tab create", silent = true })
vim.keymap.set("n", "<leader>tk", ":tabnext<cr>", { desc = "tab next", silent = true })
vim.keymap.set("n", "<leader>tk", ":tabprevious<cr>", { desc = "tab previous", silent = true })
vim.keymap.set("n", "<leader>tx", ":tabclose<cr>", { desc = "tab close", silent = true })
vim.keymap.set("n", "<leader>tt", ":set showtabline=1<cr>", { desc = "tab close", silent = true })

vim.keymap.set("n", "<M-right>", ":tabnext<cr>", { desc = "tab next", silent = true })
vim.keymap.set("n", "<M-left>", ":tabprevious<cr>", { desc = "tab previous", silent = true })
vim.keymap.set("n", "<M-k>", ":tabnext<cr>", { desc = "tab next", silent = true })
vim.keymap.set("n", "<M-j>", ":tabprevious<cr>", { desc = "tab previous", silent = true })

-- INFO: I want C-c to execute autocmd InsertLeave, as I'm addicted to C-c on everything
-- and would love highlighters to still be able to do their job.
-- I'm still putting in an exit strategy if this causes problems,
-- you want still qq to get the original C-c behaviour.
vim.keymap.set("i", "jj", "<Esc>", { silent = true });
vim.keymap.set("i", "qq", "<C-c>", { silent = false });
vim.keymap.set("i", "<C-c>", "<Esc>", { silent = true });

vim.keymap.set("n", "<leader>fR", ":Lazy reload telescope.nvim<cr>", { desc = "Sometimes telescope can't init, reload usually does the trick", silent = true});
vim.keymap.set("n", "<leader>tt", ":set showtabline=1<cr>", { desc = "Sometimes telescope can't init, reload usually does the trick", silent = true});
