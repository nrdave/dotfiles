-- Plugin for formatting
return {
	'stevearc/conform.nvim',
	opts = {},
	config = function()
		require("conform").setup({
			-- Place formatters here
			-- Note that formatters that come with a language server e.g clang_format
			-- are detected automatically, so there's no need to include them here
			formatters_by_ft = {
				python = {
					lsp_format = 'first',
				},
				markdown = { "mdslw" },
			},
			formatters = {
				mdslw = { prepend_args = { "--stdin-filepath", "$FILENAME" } },
			},
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 500,
			},
		})
		-- Keybind to manually format - comes with a longer timeout
		vim.keymap.set("n", "<leader>f", function()
			require("conform").format({
				lsp_fallback = true,
				timeout_ms = 1000,
				async = false,
			})
			end
		)
	end
}
