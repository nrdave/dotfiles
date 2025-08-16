-- Commands taken from
-- https://www.youtube.com/watch?v=skW3clVG5Fo

local augroup = vim.api.nvim_create_augroup("thermo_config", {})

-- Highlight text when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Auto-resize splits on window resize
vim.api.nvim_create_autocmd("VimResized", {
	group = augroup,
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- Create directories when saving files
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	callback = function()
		local dir = vim.fn.expand('<afile>:p:h')
		if vim.fn.isdirectory(dir) == 0 then
			vim.fm.mkdir(dir, 'p')
		end
	end,
})

