return {
	-- Useful plugin to show you pending keybinds
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		delay = 0,

		-- Document key mappings
		spec = {
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>t", group = "[T]oggle" },
			{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
		},
	},
}
