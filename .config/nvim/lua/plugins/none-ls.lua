return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.diagnostics.clang_check,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.diagnostics.mypy,
				null_ls.builtins.diagnostics.flake8,
				null_ls.builtins.formatting.autopep8
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})
	
	vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	
	end,

}
