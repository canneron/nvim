return {
	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			require("mini.ai").setup({ n_lines = 500 })

			require("mini.surround").setup()

			require("mini.statusline").setup({
				use_icons = vim.g.have_nerd_font,
			})

			require("mini.comment").setup()

			require("mini.statusline").section_location = function()
				return "%2l:%-2v"
			end
		end,
	},
}
