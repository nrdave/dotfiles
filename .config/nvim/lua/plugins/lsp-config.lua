return {
	
	-- Grab mason.nvim for installing LSP servers in cases where the server
	-- isn't installed on the system
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗"
					}
				}
			})
		end,
	},
	-- mason-lspconfig.nvim is recommended by the mason.nvim dev if also using
	-- nvim-lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
	    lazy = false,
		opts = {
			auto_install = false,
		},
	},
	-- Get Neovim's default LSP configs
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			
			local on_attach = function(_, bufnr)
				vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
				require('completion').on_attach()
			end

			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.pylsp.setup({
				capabilities = capabilities,
			})
			lspconfig.zls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.ruff_lsp.setup({
				capabilities = capabilities,
				init_options = {
				settings = {
					args = {},
					}
				}
			})

		end,
	},
}
