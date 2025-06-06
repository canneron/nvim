return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"lua",
				"luadoc",
				"go",
				"java",
				"vim",
			},
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
				disable = { "ruby" },
			},
		},
	},
}
