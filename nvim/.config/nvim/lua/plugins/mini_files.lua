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

        local minifiles_toggle = function(...)
            if not MiniFiles.close() then
                MiniFiles.open(...)
            end
        end
        vim.keymap.set("n", "<C-n>", minifiles_toggle, { noremap = true, silent = true })
    end,
}
