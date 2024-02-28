-- set leader key to space
vim.g.mapleader = " "
vim.opt.fillchars = { eob = " ", fold = " ", foldopen = "▼", foldsep = " ", foldclose = "⏵" }

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>[]hl")

-- encoding format
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- ufo configuration
vim.o.foldcolumn = "1"
vim.o.foldlevel = 1
vim.o.foldlevelstart = 99
vim.o.foldenable = true
-- keep folds after save
vim.api.nvim_exec(
	[[
  augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
  augroup END
]],
	false
)

-- always show the sign column
vim.opt.signcolumn = "yes"

-- enable relative line numbers
vim.opt.nu = true
vim.opt.rnu = true

-- enable smart indenting
vim.opt.breakindent = true
vim.opt.smartindent = true

-- enable auto indent
vim.opt.autoindent = true

-- disable swap file
vim.opt.swapfile = false

-- cdm line settings
vim.opt.showcmd = true
vim.opt.cmdheight = 1

-- tab settings
vim.opt.tabstop = 2
vim.opt.smarttab = true

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true

-- enable line wrap
vim.opt.wrap = true

-- enable mouse
vim.opt.mouse = "a"

-- enable clipboard
vim.opt.clipboard = "unnamed,unnamedplus"

-- enable incremental search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- split options
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "cursor"

-- scss variables for cmp auto complete
vim.g.sass_variables_file = "_variables.scss"

-- enable 24-bit colors
vim.opt.termguicolors = true

-- disable cursorline highlight
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- always keeep 10 line above/below cursor
vim.opt.scrolloff = 10

-- disable vim intro
vim.opt.shortmess:append("sI")

vim.opt.ruler = true

-- I dont know what these are for ?!!!
vim.opt.backup = false
vim.o.laststatus = 3
vim.opt.shiftwidth = 2
vim.opt.wildignore:append({ "*/node_modules/*" })

-- Undercurl
-- vim.cmd([[let &t_Cs = "\e[4:3m"]])
-- vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Add asterisks in block comments
-- vim.opt.formatoptions:append({ "r" })
--
-- vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])
-- vim.cmd([[au BufNewFile,BufRead Podfile setf ruby]])

-- blinking cursor
-- vim.o.guicursor = "n-v-c-sm-i-ci-ve:block,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"

-- Fix the temrinal cursor change after exit
-- Define autocmd group
-- vim.cmd("augroup RestoreCursorShapeOnExit")
-- vim.cmd("autocmd!")
-- -- Set guicursor to a:hor20 upon exiting Neovim
-- vim.cmd("autocmd VimLeave * set guicursor=a:hor20")
-- -- End autocmd group:w
-- vim.cmd("augroup END")

-- close neotree on exit for session bug
vim.cmd([[autocmd VimLeave * Neotree filesystem close]])

-- Show line diagnostics automatically in hover window
-- vim.o.updatetime = 250
-- vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
