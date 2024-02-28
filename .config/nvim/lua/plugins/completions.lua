return {
	{
		"pontusk/cmp-sass-variables",
	},
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			local icons = require("core.icons")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
					completion = cmp.config.window.bordered({
						border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
						-- border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
						scrollbar = false,
						winhighlight = "Normal:Normal,FloatBorder:CmpWinBorder,CursorLine:PmenuSel,Search:None",
					}),
					documentation = cmp.config.window.bordered({
						border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
						-- border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
						scrollbar = false,
						winhighlight = "Normal:Normal,FloatBorder:CmpWinBorder,CursorLine:PmenuSel,Search:None",
					}),
				},

				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<D-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "sass-variables" },
				}, {
					{ name = "buffer" },
				}),
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(_, item)
						local kind = item.kind
						item.kind = icons.kind[kind]
						item.menu = kind:gsub("(%l)(%u)", "%1 %2"):lower()

						return item
					end,
				},
			})
		end,
	},
}
