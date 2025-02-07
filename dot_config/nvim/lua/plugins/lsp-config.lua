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
			end

			lspconfig.clangd.setup({
				capabilities = capabilities,
				cmd = { "clangd", '--fallback-style=none' },
			})
			lspconfig.ruff.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				init_options = {
					settings = {
						lint = {
							select = {"D", "E", "F", "W"},
							ignore = { "D212", "D400", "D407", "D415", "E203", },
						},
						lineLength = 79,
					}
				}
			})
			lspconfig.pylsp.setup({
				capabilities = capabilities,
				settings = {
					pylsp = {
						settings = {
							plugins = {
								pylint = { enabled = false },
								pyflakes = { enabled = false },
								pycodestyle = { enabled = false },
								pylsp_mypy = { enabled = true },
							}
						}
					}
				}
			})
			lspconfig.zls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.tinymist.setup({
				capabilities = capabilities,
				single_file_support = true,
				settings = {
					exportPdf = "onSave",
					formatterMode= "typstyle",
					formatterPrintWidth= 80,
				},
			})
		end,
	},
}
