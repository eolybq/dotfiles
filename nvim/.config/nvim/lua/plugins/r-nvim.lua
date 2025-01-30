return {
	{
		"R-nvim/R.nvim",
		config = function()
			local opts = {
				external_term = "tmux split-window -h -l 45 -d",
				-- external_term = "default",
				R_app = "radian",
				R_cmd = "R",
				bracketed_paste = true,
				silent_term = true,
				auto_quit = true,
				auto_start = "always",
				hook = {
					on_filetype = function()
						vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
						vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
					end,
				},
				R_args = { "--quiet", "--no-save" },
				min_editor_width = 72,
				rconsole_width = 78,
				objbr_mappings = { -- Object browser keymap
					c = "class", -- Call R functions
					["<localleader>gg"] = "head({object}, n = 15)", -- Use {object} notation to write arbitrary R code.
					v = function()
						-- Run lua functions
						require("r.browser").toggle_view()
					end,
				},
				disable_cmds = {
					"RClearConsole",
					"RCustomStart",
					"RSPlot",
					"RSaveClose",
				},
			}
			require("r").setup(opts)
		end,
	},
}
