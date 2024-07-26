return {
	"nguyenvukhang/nvim-toggler",
	opts = {
		inverses = {
			["!=="] = "===",
			["&&"] = "||",
		},
		-- removes the default <leader>i keymap
		remove_default_keybinds = true,
	},
	keys = {
		{ "<leader>tv", '<cmd>lua require("nvim-toggler").toggle()<CR>', desc = "Toggle value (eg. true → false)" },
	},
}
