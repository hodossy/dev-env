return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			current_line_blame = true,
			current_line_blame_opts = {
				delay = 200,
			},
		})

		vim.keymap.set(
			"n",
			"<leader>gtb",
			":Gitsigns toggle_current_line_blame<CR>",
			{ desc = "Toggle current line blame" }
		)
		vim.keymap.set(
			"n",
			"<leader>gtd",
			":Gitsigns toggle_deleted<CR>:Gitsigns toggle_linehl<CR>",
			{ desc = "Toggle diff view" }
		)
	end,
}
