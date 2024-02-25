return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"emmet_ls",
					"eslint",
					"html",
					"pyright",
					"lua_ls",
					"tsserver",
					"ruff_lsp",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local htmlCapabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			local lspconfig = require("lspconfig")

			-- diagnostics icons
			-- local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }

			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end
			-- diagnostics messages
			vim.diagnostic.config({
				virtual_text = {
					prefix = " ■ ", -- Could be '●', ' ▎', 'x',
					source = "always",
				},
			})

			local border = {
				{ "┏", "FloatBorder" },
				{ "━", "FloatBorder" },
				{ "┓", "FloatBorder" },
				{ "┃", "FloatBorder" },
				{ "┛", "FloatBorder" },
				{ "━", "FloatBorder" },
				{ "┗", "FloatBorder" },
				{ "┃", "FloatBorder" },
			}
			local handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
			}

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			lspconfig.tsserver.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			lspconfig.html.setup({
				htmlCapabilities = htmlCapabilities,
				handlers = handlers,
			})

			lspconfig.cssls.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			lspconfig.emmet_ls.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			lspconfig.pyright.setup({
				capabilities = capabilities,
				handlers = handlers,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
