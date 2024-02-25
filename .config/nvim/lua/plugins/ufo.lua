return {
	"kevinhwang91/nvim-ufo",
	event = "VeryLazy",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	config = function()
		require("ufo").setup({
			vim.keymap.set("n", "zo", require("ufo").openAllFolds),
			vim.keymap.set("n", "zc", require("ufo").closeAllFolds),
		})
	end,
}
