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
			})
			lspconfig.ruff_lsp.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				init_options = {
					settings = {
						args = {
							"--select", "D",
							"--select", "E",
							"--select", "F",
							"--select", "W",
							"--ignore", "D212",
							"--ignore", "D400",
							"--ignore", "D407",
							"--ignore", "D415",
							-- Ignore whitespace between colon as a slice operator (taking a section
							-- of an array or list).
							-- See https://peps.python.org/pep-0008/#whitespace-in-expressions-and-statements
							"--ignore", "E203",
							"--line-length=79"
						},
					}
				}
			})
			lspconfig.pylsp.setup({
				capabilities = capabilities,
				settings = {
					pylsp = {
						settings = {
							plugins = {
								pylint = { enabled = "false" },
								pyflakes = { enabled = "false" },
								pycodestyle = { enabled = "false" },
							}
						}
					}
				}
			})
			lspconfig.zls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			
		end,
	},
}
