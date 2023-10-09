-- INFO: dashboard that shows on startup
-- tags: UI

local header = {
	[[                                    (_)                                      ]],
	[[ _ __ ___   ___  _____      ____   ___ _ __ ___       |\      _,,,---,,_     ]],
	[[| '_ ` _ \ / _ \/ _ \ \ /\ / /\ \ / / | '_ ` _ \  Z zz /,`.-'`'    -.  ;-;;,_]],
	[[| | | | | |  __/ (_) \ V  V /  \ V /| | | | | | |    |,4-  ) )-,_. ,\ (  `'-']],
	[[|_| |_| |_|\___|\___/ \_/\_/    \_/ |_|_| |_| |_|   '---''(_/--'  `-'\_)     ]],
}


return {
	{
		"goolord/alpha-nvim",
		lazy = false,
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local startify = require("alpha.themes.startify")
			startify.section.header.val = header
			require("alpha").setup(startify.config)
		end,
		keys = {
			{ "<leader>a", ":Alpha<cr>", desc = "dashboard" },
		},
	},
}
