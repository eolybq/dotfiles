return {
    {
        "EdenEast/nightfox.nvim",
        config = function()
            -- Nastavení Nightfox
            require("nightfox").setup({
                options = {
                    -- Příklad konfigurace
                    transparent = false, -- Nepoužívej průhledné pozadí
                },
            })
            vim.cmd("colorscheme carbonfox") -- Aktivace barevného schématu
        end,
    }
}

