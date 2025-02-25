return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader><space>", builtin.find_files, {})
            vim.keymap.set("n", "<leader>sg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>sr", builtin.resume, { noremap = true, silent = true })
            vim.keymap.set("n", "<leader>sh", builtin.help_tags)
vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Telescope buffers' })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                defaults = {

                    dynamic_preview_title = true,
                    results_title = false,

                    layout_strategy = "flex",
                    layout_config = {
                        prompt_position = "top",
                        preview_cutoff = 10,
                        horizontal = {
                            preview_width = 0.6,
                        },
                    },

                    sorting_strategy = "ascending",

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
                    live_grep = {
                        additional_args = function(opts)
                            return { "--hidden" }
                        end,
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
