return {
	"echasnovski/mini.nvim",
	event = "VeryLazy",
	version = "*",
	config = function()
		require("mini.indentscope").setup()
		require("mini.pairs").setup()
	end,
}
