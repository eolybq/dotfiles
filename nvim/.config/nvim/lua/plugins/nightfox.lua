return {
	{
		"EdenEast/nightfox.nvim",
		config = function()
			-- Nastavení Nightfox
			require("nightfox").setup({
				options = {
					-- Příklad konfigurace
					transparent = false, -- Nepoužívej průhledné pozadí
					styles = {
						comments = "italic", -- Komentáře budou kurzívou
						keywords = "bold", -- Klíčová slova budou tučně
						conditionals = "bold",
					},
					inverse = {
						match_paren = true, -- Zvýraznění párů závorek
						search = false, -- Zvýraznění hledání
					},
				},
			})
			vim.cmd("colorscheme carbonfox") -- Aktivace barevného schématu
		end,
	},
}
