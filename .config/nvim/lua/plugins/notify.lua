return {
	"rcarriga/nvim-notify",

	opts = {
		timeout = 3000,
		max_height = function()
			return math.floor(vim.o.lines * 0.75)
		end,
		max_width = function()
			return math.floor(vim.o.columns * 0.75)
		end,
		on_open = function(win)
			vim.api.nvim_win_set_config(win, { zindex = 100 })
		end,
	},
	lazy = true,
	config = function()
		vim.opt.termguicolors = true
		vim.notify = require("notify")
		local notify_status_ok, notify = pcall(require, "notify")
		if not notify_status_ok then
			print("notify not found!")
		end

		---@diagnostic disable-next-line: missing-fields
		notify.setup({
			minimum_width = 50,
			render = "default",
			stages = "fade",
			timeout = 2000,
			fps = 30,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
			icons = {
				DEBUG = "",
				ERROR = "",
				INFO = "",
				TRACE = "✎",
				WARN = "",
			},
		})

		local severity = {
			"error",
			"warn",
			"info",
		}
		vim.lsp.handlers["window/showMessage"] = function(method, params)
			vim.notify(method.message, severity[params.type])
		end
	end,
}
