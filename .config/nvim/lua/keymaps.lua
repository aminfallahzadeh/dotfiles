-- general keymaps
-- save with command + s and go back to normal mode
vim.keymap.set({ "n", "i" }, "<D-s>", "<ESC>:w<CR>", { noremap = true, silent = true })

-- tab management
-- open a new tab
vim.api.nvim_set_keymap("n", "<leader>tt", ":tabnew<CR>", { noremap = true })
-- Go to next tab
vim.api.nvim_set_keymap("n", "<leader>tn", ":tabnext<CR>", { noremap = true, silent = true })
-- Go to previous tab
vim.api.nvim_set_keymap("n", "<leader>tp", ":tabprevious<CR>", { noremap = true, silent = true })

-- Switch to next buffer
vim.api.nvim_set_keymap("n", "<leader>bn", ":bnext<CR>", { noremap = true, silent = true })
-- Switch to previous buffer
vim.api.nvim_set_keymap("n", "<leader>bp", ":bprevious<CR>", { noremap = true, silent = true })

-- open new split pane to right
vim.api.nvim_set_keymap("n", "<leader>sr", ":vsplit<CR>", { noremap = true })

-- open new split pane to left
vim.api.nvim_set_keymap("n", "<leader>sl", "<Cmd>vsplit<CR><C-w>h", { noremap = true, silent = true })

-- change window width/height
-- Keymap to increase window width
vim.api.nvim_set_keymap("n", "<C-w>l", ":vertical resize +5<CR>", { noremap = true, silent = true })

-- Keymap to decrease window width
vim.api.nvim_set_keymap("n", "<C-w>h", ":vertical resize -5<CR>", { noremap = true, silent = true })

-- Keymap to increase window height
vim.api.nvim_set_keymap("n", "<C-w>k", ":resize +5<CR>", { noremap = true, silent = true })

-- Keymap to decrease window height
vim.api.nvim_set_keymap("n", "<C-w>j", ":resize -5<CR>", { noremap = true, silent = true })

-- toggle neotree
vim.keymap.set(
	"n",
	"<C-n>",
	":Neotree position=filesystem reveal float toggle=true<CR>",
	{ noremap = true, silent = true }
)

-- toggle spectre
vim.keymap.set("n", "<leader>sp", '<cmd>lua require("spectre").toggle()<CR>', {
	desc = "Toggle Spectre",
}, { noremap = true, silent = true })

-- switch panes keymaps
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })

-- copy/paste keymaps
-- Yank into system clipboard
vim.keymap.set({ "n", "v" }, "<D-c>", '"+y') -- yank motion
vim.keymap.set({ "n", "v" }, "<D-cl>", '"+Y') -- yank line

-- Delete into system clipboard
vim.keymap.set({ "n", "v" }, "<D-x>", '"+d') -- delete motion
vim.keymap.set({ "n", "v" }, "<D-xl>", '"+D') -- delete line

-- markdown preview
vim.keymap.set("n", "<C-s>", ":MarkdownPreviewToggle<CR>", { noremap = true, silent = true })

-- dismiss noice messages
vim.api.nvim_set_keymap("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })

-- lsp keymaps
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

-- toggle term
function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<jk>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- illuminate keymaps
vim.keymap.set("n", "<S-n>", function()
	require("illuminate").goto_next_reference()
end)
vim.keymap.set("n", "<S-p>", function()
	require("illuminate").goto_prev_reference()
end)

-- bufferline keymaps
vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
