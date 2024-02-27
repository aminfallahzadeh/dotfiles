return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato",
				integrations = {
					aerial = true,
					indent_blankline = {
						enabled = true,
						scope_color = "lavender",
						colored_indent_levels = false,
					},
				},
			})
			-- vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup({
				devicons = true,
			})
			-- vim.cmd.colorscheme("monokai-pro")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				highlight_groups = {
					TelescopeResultsTitle = { fg = "surface", bg = "surface" },
					TelescopeBorder = { fg = "surface", bg = "surface" },
					TelescopeSelection = { fg = "text", bg = "overlay", bold = true },
					TelescopeSelectionCaret = { fg = "text", bg = "highlight_med" },
					TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

					TelescopeTitle = { fg = "base", bg = "love" },
					TelescopePromptTitle = { fg = "base", bg = "love" },
					TelescopePreviewTitle = { fg = "base", bg = "foam" },

					TelescopePromptNormal = { bg = "overlay" },
					TelescopePromptBorder = { fg = "overlay", bg = "overlay" },
					TelescopePromptPrefix = { fg = "love", bg = "overlay" },
					CmpWinBorder = { fg = "overlay", bg = "base" },

					DiagnosticVirtualTextError = { bg = "#191724" },
					DiagnosticVirtualTextHint = { bg = "#191724" },
					DiagnosticVirtualTextInfo = { bg = "#191724" },
					DiagnosticVirtualTextWarn = { bg = "#191724" },

					CursorLineNr = { fg = "#ebbcba" },
				},
			})
			vim.cmd.colorscheme("rose-pine")
		end,
	},
}
