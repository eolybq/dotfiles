return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					auto_trigger = true,
					enabled = false,
				},
				panel = { enabled = false },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" }, -- for curl, log and async functions
		},
		event = "VimEnter",
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = function()
			local user = vim.env.USER or "User"
			user = user:sub(1, 1):upper() .. user:sub(2)
			return {
				question_header = "  " .. user .. " ",
				answer_header = "  Copilot ",
				window = {
					width = 0.3,
				},
			}
		end,
		config = function(_, opts)
			local chat = require("CopilotChat")

			vim.keymap.set("n", "<C-w>g", function()
				chat.toggle({
					window = {
						layout = "float",
						title = "Quick Chat",
						width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
						height = 0.5,
					},
				})
			end)

			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "copilot-chat",
				callback = function()
					vim.opt_local.relativenumber = false
					vim.opt_local.number = false
				end,
			})

			chat.setup(opts)
		end,
	},
}
