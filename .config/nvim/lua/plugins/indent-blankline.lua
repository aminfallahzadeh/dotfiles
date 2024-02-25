return {
	"lukas-reineke/indent-blankline.nvim",
	event = "VeryLazy",
	main = "ibl",
	config = function()
		require("ibl").setup({
			scope = { enabled = false },
		})
	end,
}
