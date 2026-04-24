return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
	config = function()
		require("barbar").setup({})

		local opts = { noremap = true, silent = true }
		vim.api.nvim_set_keymap("n", "<A-h>", "<Cmd>BufferPrevious<CR>", opts)
		vim.api.nvim_set_keymap("n", "<A-l>", "<Cmd>BufferNext<CR>", opts)

		vim.api.nvim_set_keymap("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
		vim.api.nvim_set_keymap("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
		vim.api.nvim_set_keymap("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
		vim.api.nvim_set_keymap("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
		vim.api.nvim_set_keymap("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
		vim.api.nvim_set_keymap("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
		vim.api.nvim_set_keymap("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
		vim.api.nvim_set_keymap("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
		vim.api.nvim_set_keymap("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
		vim.api.nvim_set_keymap("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)

		vim.api.nvim_set_keymap("n", "<leader>bp", "<Cmd>BufferPick<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>bc", "<Cmd>BufferClose<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>bC", "<Cmd>BufferCloseAllButCurrent<CR>", opts)
	end,
}
