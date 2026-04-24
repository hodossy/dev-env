return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = { mode = "cursor", max_lines = 3 },
	},
}
