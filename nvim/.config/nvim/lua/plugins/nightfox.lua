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
                },
            })
            vim.cmd("colorscheme carbonfox") -- Aktivace barevného schématu
        end,
    }
}

