-- Set up completions using nvim-cmp
return {
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
				  expand = function(args)
					require('luasnip').lsp_expand(args.body)
				  end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
					{ name = 'buffer' },
				}, 
				{
					{ name = 'buffer' },
				})
			})
		end,
	},
	{
		-- Completions from language servers
		"hrsh7th/cmp-nvim-lsp"
	},
	{
		-- Snippet engine
		"L3MON4D3/LuaSnip"
	},
	{
		-- Completion source for LuaSnip (above)
		"saadparwaiz1/cmp_luasnip"
	},
	{
		-- Completions from the current buffer
		"hrsh7th/cmp-buffer"
	},
}
