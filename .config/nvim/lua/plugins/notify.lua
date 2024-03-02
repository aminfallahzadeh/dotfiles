return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	opts = {
		timeout = 5000,
		background_colour = "#000000",
		render = "wrapped-compact",
	},
	config = function()
		require("notify").setup({
			max_width = 50,
		})
	end,
}
