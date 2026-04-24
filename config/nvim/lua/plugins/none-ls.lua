return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspAutoFormatting", {})
		local autoFormat = true

		null_ls.setup({
			sources = {
				-- code actions
				require("none-ls.code_actions.eslint"),
				-- diagnostics
				null_ls.builtins.diagnostics.hadolint,
				null_ls.builtins.diagnostics.stylelint,
				null_ls.builtins.diagnostics.yamllint,
				require("none-ls.diagnostics.eslint"),
				-- formatting
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.stylua,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							if autoFormat then
								vim.lsp.buf.format({ timeout_ms = 2000 })
							end
						end,
					})
				end
			end,
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format file" })
		vim.keymap.set("n", "<leader>gtf", function()
			autoFormat = not autoFormat
			if autoFormat then
				vim.notify("Format on save turned on!", vim.log.levels.INFO)
			else
				vim.notify("Format on save turned off!", vim.log.levels.INFO)
			end
		end, { desc = "Toggle format on save" })
	end,
}
