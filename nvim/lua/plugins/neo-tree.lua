return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			filesytem = {
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
			},
		})

		-- open neo-tree on startup
		vim.api.nvim_create_autocmd("VimEnter", {
			pattern = "*",
			group = vim.api.nvim_create_augroup("NeotreeOnOpen", { clear = true }),
			once = true,
			callback = function(_)
				local win_handle = vim.api.nvim_get_current_win()
				vim.cmd("Neotree")
				vim.cmd("setlocal nonumber")
				vim.cmd("setlocal norelativenumber")
				if vim.fn.argc() > 0 then
					vim.api.nvim_set_current_win(win_handle)
				end
			end,
		})

		vim.keymap.set("n", "<leader>nt", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
	end,
}
