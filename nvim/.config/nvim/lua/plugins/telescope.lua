return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fr", builtin.resume, { noremap = true, silent = true })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				defaults = {
					prompt_prefix = "❯ ",
					selection_caret = "❯",
					file_ignore_patterns = {
						"%.git/.*",
						"%.cache",
						"node_modules/.*",
						"yarn.lock",
						"lazy%-lock.json",
						"package%-lock.json",
						"miniconda3/*",
						-- "%.o",
						-- "%.a",
						-- "%.out",
						-- "%.class",
						"%.pdf",
						"%.mkv",
						"%.mp4",
						"%.zip",
					},
				},
				pickers = {
					find_files = {
						hidden = true,
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
