return {
	{ "github/copilot.vim" },
	{
		"carlos-algms/agentic.nvim",
		opts = {
			provider = "copilot-acp",
		},
		keys = {
			{
				"<leader>ta",
				function()
					require("agentic").toggle()
				end,
				mode = { "n" },
				desc = "Toggle Agentic Chat",
			},
			{
				"<leader>ac",
				function()
					require("agentic").add_selection_or_file_to_context()
				end,
				mode = { "n", "v" },
				desc = "Add file or selection to agent context",
			},
		},
	},
}
