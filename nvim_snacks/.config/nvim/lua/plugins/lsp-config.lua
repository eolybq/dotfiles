return {
	{
		"neovim/nvim-lspconfig",
		config = function()

            vim.diagnostic.config({
                virtual_text = true, -- zobrazí chyby přímo na řádku
                signs = true,        -- zobrazí symboly jako E, W vedle čísel řádků
                underline = true,    -- podtrhne řádky s chybou
                update_in_insert = false,
                severity_sort = true,
            })

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})

			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

			lspconfig.marksman.setup({
				capabilities = capabilities,
			})

			lspconfig.r_language_server.setup({
				capabilities = capabilities,
			})

		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				auto_install = true,
			})
		end,
	},
}
