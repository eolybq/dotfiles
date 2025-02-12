return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = { --[[ things you want to change go here]]
		},
		config = function()
			require("toggleterm").setup({
				direction = "float",
				open_mapping = [[<C-w>f]]
			})
		end,
	},
}
