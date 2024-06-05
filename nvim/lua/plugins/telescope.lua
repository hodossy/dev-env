return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"isak102/telescope-git-file-history.nvim",
		dependencies = { "tpope/vim-fugitive" },
	},
	{ "nvim-telescope/telescope-media-files.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					layout_config = {
						horizontal = {
							preview_cutoff = 0,
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					fzf = {
						fuzzy = true,
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files (fuzzy)" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find files by content" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
			vim.keymap.set(
				"n",
				"<leader>fe",
				builtin.current_buffer_fuzzy_find,
				{ desc = "Find in current buffer (fuzzy)" }
			)
			vim.keymap.set("n", "<leader>fh", ":Telescope git_file_history<CR>", { desc = "File history" })

			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("git_file_history")
			require("telescope").load_extension("media_files")
		end,
	},
}
