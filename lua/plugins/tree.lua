return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local api = require("nvim-tree.api")

		require("nvim-tree").setup({
			renderer = { group_empty = true },
			on_attach = function(bufnr)
				api.config.mappings.default_on_attach(bufnr)
				vim.keymap.set("n", "v", api.node.open.vertical, { buffer = bufnr, desc = "Vertical Split" })
				vim.keymap.set("n", "s", api.node.open.horizontal, { buffer = bufnr, desc = "Horizontal Split" })
				vim.keymap.set("n", "t", api.node.open.tab, { buffer = bufnr, desc = "New Tab" })
			end,
		})

		-- Optional: Toggle file tree with <leader>t
		vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { desc = "Toggle File Tree" })
	end,
}
