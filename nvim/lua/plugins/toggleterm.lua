return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({})

		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			-- exit terminal insert mode
			vim.keymap.set("t", "<C-e>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
		end

		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
	keys = {
		{ "<leader>t1", ":1ToggleTerm<CR>", desc = "Toggle Terminal 1" },
		{ "<leader>t2", ":2ToggleTerm<CR>", desc = "Toggle Terminal 2" },
		{ "<leader>tf", ":3ToggleTerm direction=float<CR>", desc = "Toggle Float Terminal" },
		{ "<leader>ta", ":ToggleTermToggleAll<CR>", desc = "Toggle All Terminals" },
	},
}
