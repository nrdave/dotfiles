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
			
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.pylsp.setup({
				capabilities = capabilities,
			})

		end,
	},
}
