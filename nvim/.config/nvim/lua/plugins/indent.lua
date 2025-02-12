return {
    "echasnovski/mini.indentscope",
    version = false,
    event = "BufRead",
    config = function()
        require("mini.indentscope").setup()
    end,
}
