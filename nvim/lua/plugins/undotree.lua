return {
	"mbbill/undotree",
	config = function()
		vim.g.undotree_WindowLayout = 3
	end,
	keys = {
		{ "<leader>ut", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undotree window" },
	},
}
