return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_install = true,
			ensure_installed = {
                "lua",
                "python",
                "r",
                "hyprlang",
                "bash",
                "rasi"
            },
			highlight = { enable = true },
			indent = { enable = true },

			vim.filetype.add({
				extension = { rasi = "rasi" },
				pattern = {
					[".*/waybar/config"] = "jsonc",
					[".*/kitty/*.conf"] = "bash",
					[".*/hypr/.*%.conf"] = "hyprlang",
				},
			}),
		})
	end,
}
