if vim.g.vscode then

	-- VSCode extension
else
	vim.g.guisp = true
	require("eriizu")

	if vim.g.neovide then
		vim.o.guifont = "Fira Mono:h10"
		vim.g.neovide_padding_top = 5
		vim.g.neovide_padding_bottom = 5
		vim.g.neovide_padding_right = 5
		vim.g.neovide_padding_left = 5
		vim.g.neovide_transparency = 0.9
		vim.g.neovide_floating_blur_amount_x = 2.0
		vim.g.neovide_floating_blur_amount_y = 2.0
	else
		vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
		vim.cmd("au VimLeave * set guicursor=a:hor10-blinkon0")
	end
	-- ordinary Neovim
end
