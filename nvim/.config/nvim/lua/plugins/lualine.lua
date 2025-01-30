return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "ayu_dark",
				-- section_separators = { left = "", right = "" },
				section_separators = "",
				component_separators = "|"
			},
			sections = {
				lualine_x = {
					{
						require("noice").api.statusline.mode.get,
						cond = require("noice").api.statusline.mode.has,
						color = { fg = "#ff9e64" },
					},
				"encoding",
				"fileformat",
				"filetype",
				},
			},
		})
	end,
}
