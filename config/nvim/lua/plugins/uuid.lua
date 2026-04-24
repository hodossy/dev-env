return {
	"TrevorS/uuid-nvim",
	lazy = true,
	config = function()
		require("uuid-nvim").setup({})
	end,
	keys = {
		{
			"<leader>iu",
			"<cmd>UuidV4<CR>",
			desc = "Insert UUID v4",
		},
	},
}
