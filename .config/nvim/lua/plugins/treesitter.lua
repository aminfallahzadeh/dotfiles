return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = false -- Auto close on trailing </
				  },
				  per_filetype = {
					["html"] = {
					  enable_close = true
					},
					["xml"] = {
					  enable_close = true
					},
					["javascript"] = {
					  enable_close = true
					},
					["typescript"] = {
					  enable_close = true
					},
					["javascriptreact"] = {
					  enable_close = true
					},
					["typescriptreact"] = {
					  enable_close = true
					},
					["jsx"] = {
					  enable_close = true
					},
					["tsx"] = {
					  enable_close = true
					},
					["markdown"] = {
					  enable_close = true
					}
				  }
			})
		end,
	},
}
