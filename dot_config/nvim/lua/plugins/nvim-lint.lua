return {
	{
		"mfussenegger/nvim-lint",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		config = function()
			require('lint').linters_by_ft = {
				-- Currently nothing, I just keep this on hand in case I need
				-- to use standalone linters
			}
			vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end

	},
}
