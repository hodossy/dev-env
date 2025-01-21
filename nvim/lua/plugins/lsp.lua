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
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.angularls.setup({
				capabilities = capabilities,
				root_dir = lspconfig.util.root_pattern("angular.json", "package.json"),
			})
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.eslint.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show error in a floating window" })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Show references" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
		end,
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		-- if loaded lazily, then it does not gets attached to the buffers
		lazy = false,
		config = function()
			local ts_tools = require("typescript-tools")
			local lspconfig = require("lspconfig")

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
				root_dir = lspconfig.util.root_pattern(
					"tsconfig.base.json",
					"tsconfig.json",
					"jsconfig.json",
					"package.json",
					".git"
				),
				settings = {
					tsserver_max_memory = 8096,
					complete_function_calls = true,
				},
			})
		end,
	},
}
