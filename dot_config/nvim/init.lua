vim.cmd.colorscheme("thermo")

-- Took a lot of this from
-- https://www.youtube.com/watch?v=skW3clVG5Fo

-- Statusline
require('statusline')
require('autocmds')

-- Line number
vim.opt.number = true			-- Line numbers
vim.opt.relativenumber = true	-- Relative numbers
vim.opt.cursorline = true		-- Highlight
vim.opt.wrap = false
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 10

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Visual
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

-- Show matching brackets for 2 seconds
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.cmdheight = 1
-- show menu for completions, but don't select any completion, even if only one
-- option is available
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}	
vim.opt.lazyredraw = true

-- File handling
vim.opt.swapfile = false
vim.opt.undofile = true -- stored in undodir, which defaults to within
						-- XDG_STATE_HOME
vim.opt.autoread = true
vim.opt.autowrite = false

-- Behavior
vim.opt.hidden = true
vim.opt.iskeyword:append("-")
-- Enables tab completion, searching recursively through subdirectories
vim.opt.wildmenu = true
vim.opt.wildmode = ("longest:full,full")
vim.opt.path:append("**")
vim.opt.mouse = 'a'
vim.opt.clipboard:append("unnamedplus")

vim.opt.diffopt:append("linematch:60")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Splitting
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>")
vim.keymap.set("n", "<leader>sh", ":hsplit<CR>")

-- Visual mode indenting "keep-active"
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- File navigation
vim.keymap.set("n", "<leader>e", ":Explore<CR>")
vim.keymap.set("n", "<leader>ff", ":find ")

-- open config file in new tab
vim.keymap.set("n", "<leader>rc", ":tabedit $MYVIMRC<CR>")
