return {
    {
        "mawkler/modicator.nvim",
        event = "BufRead",
        config = function()
            require("modicator").setup()
        end,
    },
    {
        "sphamba/smear-cursor.nvim",
        event = "VeryLazy",
        cond = vim.g.neovide == nil,
        opts = {
            stiffness = 0.8,      -- 0.6      [0, 1]
            trailing_stiffness = 0.5, -- 0.3      [0, 1]
            distance_stop_animating = 0.5, -- 0.1      > 0
            legacy_computing_symbols_support = true,
            transparent_bg_fallback_color = "#303030",
        },
    },
}
