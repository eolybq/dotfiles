return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
					signature = { enabled = false },
					-- hover = { enabled = false },
				},

				presets = {
					bottom_search = true,
					long_message_to_split = true,
				},

				routes = {
					{
						filter = {
							event = "msg_show",
							any = {
								{ find = "%d+L, %d+B" },
								{ find = "; after #%d+" },
								{ find = "; before #%d+" },
							},
						},
						view = "mini",
					},
				},

				cmdline = {
					format = {
						shell = { pattern = "^:%s*!", icon = ">_", lang = "zsh" },
						filter = false,
					},
				},
			})
		end,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#ffffff",
				timeout = 3000,
				render = "simple",

				-- on_open = function(win)
				-- 	vim.api.nvim_win_set_config(win, { focusable = false })
				-- end,
			})
		end,
	},
}
