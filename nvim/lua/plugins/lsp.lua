return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			automatic_installation = true,
			automatic_enable = {
				exclude = {
					"ts_ls",
				},
			},
			ensure_installed = {
				"lua_ls",
				"angularls",
				"cssls",
				"eslint",
				"html",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			vim.lsp.enable({
				"lua_ls",
				"angularls",
				"cssls",
				"eslint",
				"html",
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show error in a floating window" })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Show references" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
		end,
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		-- if loaded lazily, then it does not gets attached to the buffers
		lazy = false,
		config = function()
			local ts_tools = require("typescript-tools")

			ts_tools.setup({
				on_attach = function(client, bufnr)
					vim.api.nvim_buf_set_keymap(
						bufnr,
						"n",
						"<leader>ia",
						"<cmd>TSToolsAddMissingImports<cr>",
						{ desc = "[Typescript] Import all missing" }
					)
					vim.api.nvim_buf_set_keymap(
						bufnr,
						"n",
						"<leader>io",
						"<cmd>TSToolsOrganizeImports<cr>",
						{ desc = "[Typescript] Sort imports and remove unused" }
					)
					vim.api.nvim_buf_set_keymap(
						bufnr,
						"n",
						"<leader>gs",
						"<cmd>TSToolsGoToSourceDefinition<cr>",
						{ desc = "[Typescript] Go to source definition" }
					)
				end,
				settings = {
					tsserver_max_memory = 8096,
					complete_function_calls = true,
				},
			})
		end,
	},
}
