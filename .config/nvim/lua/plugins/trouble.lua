return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		signs = {
			-- icons / text used for a diagnostic
			error = "✕",
			warning = "⚠",
			hint = "🗭",
			information = "🛈",
			other = "",
		},
		fold_open = "v", -- icon used for open folds
		fold_closed = ">", -- icon used for closed folds

		icons = false,
	},
}
