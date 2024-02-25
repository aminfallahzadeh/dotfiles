return {
	"Exafunction/codeium.vim",
	event = "VeryLazy",
	config = function()
		vim.keymap.set("i", "<TAB>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true })
	end,
}
