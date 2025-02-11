return {
	"mawkler/modicator.nvim",
    event = "BufRead",
	config = function()
		require("modicator").setup()
	end,
}
