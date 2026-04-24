return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "codedark",
			},
			sections = {
				lualine_c = {
					{ "filename", path = 1 },
				},
				lualine_x = {
					"encoding",
					{
						"fileformat",
						symbols = {
							unix = "LF", -- '', -- e712
							dos = "CRLF", -- '',  -- e70f
							mac = "CR", -- '',  -- e711
						},
					},
					"filetype",
				},
			},
			extensions = {
				"aerial",
				"lazy",
				"mason",
				"neo-tree",
				"toggleterm",
			},
		})
	end,
}
