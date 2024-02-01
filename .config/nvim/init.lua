require('options')
require('colors')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins",
-- Use Unicode characers because I don't have a nerd font
{
  ui = {
	pills = true,
    icons = {
      cmd = "⌘",
      event = "🗘",
      init = "⚙",
      keys = "🗝",
      plugin = "⨁",
      runtime = "🖧",
      require = "⥅",
      start = "🙭",
      lazy = "⏾  ",
      config = "",
      ft = " ",
      init = " ",
      keys = " ",
      loaded = "●",
      not_loaded = "○",
      plugin = " ",
      source = " ",
      task = "✔ ",
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    },
  },
})
