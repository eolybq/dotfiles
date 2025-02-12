return {
    "echasnovski/mini.files",
    version = false,
    config = function()
        require("mini.files").setup({
            windows = {
                preview = true,
                width_preview = 55,
            },
        })
    end,
}
