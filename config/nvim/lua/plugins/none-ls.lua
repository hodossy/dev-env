return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspAutoFormatting", {})
		local autoFormat = true

		local format_opts = {
			timeout_ms = 2000,
			filter = function(client)
				return client.name == "null-ls"
			end,
		}

		null_ls.setup({
			sources = {
				-- code actions
				require("none-ls.code_actions.eslint"),
				-- diagnostics
				null_ls.builtins.diagnostics.hadolint,
				null_ls.builtins.diagnostics.stylelint,
				null_ls.builtins.diagnostics.yamllint,
				require("none-ls.diagnostics.oxlint"),
				-- formatting
				null_ls.builtins.formatting.stylua,
				require("none-ls.formatting.oxfmt"),
			},
			on_attach = function(client, bufnr)
				if client.name == "null-ls" and client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							if autoFormat then
								vim.lsp.buf.format(format_opts)
							end
						end,
					})
				end
			end,
		})

		vim.keymap.set("n", "<leader>gf", function()
			vim.lsp.buf.format(format_opts)
		end, { desc = "Format file" })
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
