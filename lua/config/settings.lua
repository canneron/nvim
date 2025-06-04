-- Leader Map
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic Options
vim.opt.number = true
vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.confirm = true
vim.opt.updatetime = 250

vim.opt.listchars = { tab = "» " }

vim.opt.mouse = "a"
vim.opt.cursorline = true

-- Functions --

-- Clipboard Sync
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Highlight Yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Remapping --

-- Clear Highlighting
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })

-- Clipboard
vim.keymap.set({ "n", "x" }, "<leader>cc", '"+y', { desc = "Copy" })
vim.keymap.set({ "n", "x" }, "<leader>pp", '"+p', { desc = "Paste" })
