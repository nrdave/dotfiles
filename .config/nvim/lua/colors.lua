-- Honestly, all of this is very self-explanatory
-- Just using the terminal colors
-- 0 = black
-- 1 = red
-- 2 = green
-- 3 = yellow
-- 4 = blue
-- 5 = magenta
-- 6 = cyan
-- 7 = light grey
-- 8 = dark grey
-- 9 = light red
-- 10 = light green
-- 11 = light yellow
-- 12 = light blue
-- 13 = light magenta
-- 14 = light cyan
-- 15 = white

vim.cmd([[hi Comment ctermfg=10]])

vim.cmd([[hi Constant ctermfg=14]])

vim.cmd([[hi Identifier ctermfg=12]])
vim.cmd([[hi Function ctermfg=11]])

vim.cmd([[hi Statement ctermfg=13 cterm=bold]])

vim.cmd([[hi PreProc ctermfg=13]])

vim.cmd([[hi Type ctermfg=4 cterm=bold]])

vim.cmd([[hi Error ctermfg=0 ctermbg=1]])

vim.cmd([[hi LineNr ctermfg=8]])
vim.cmd([[hi cursorLineNr ctermfg=11]])
vim.cmd([[hi Visual ctermbg=8]])
