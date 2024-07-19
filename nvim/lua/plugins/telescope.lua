return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{
			"isak102/telescope-git-file-history.nvim",
			dependencies = { "tpope/vim-fugitive" },
		},
		"nvim-telescope/telescope-media-files.nvim",
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				layout_config = {
					horizontal = {
						preview_cutoff = 0,
					},
				},
			},
			extensions = {
				["ui-select"] = {
					telescope.themes.get_dropdown({}),
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

		telescope.load_extension("ui-select")
		telescope.load_extension("fzf")
		telescope.load_extension("git_file_history")
		telescope.load_extension("media_files")
	end,
	keys = {
		{ "<leader>ff", " :Telescope find_files<CR>", desc = "Find files (fuzzy)" },
		{ "<leader>fg", ":Telescope live_grep<CR>", desc = "Find files by content" },
		{ "<leader>fb", ":Telescope buffers<CR>", desc = "Find buffers" },
		{ "<leader>fe", ":Telescope current_buffer_fuzzy_find<CR>", desc = "Find in current buffer (fuzzy)" },
		{ "<leader>fh", ":Telescope git_file_history<CR>", desc = "File history" },
	},
}
