local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  require('plugins.lint'),
  require('plugins.treesitter'),
  require('plugins.telescope'),
  require('plugins.whichkey'),
  require('plugins.go'),
  require('plugins.mason'),
  require('plugins.tree'),
  require('plugins.autopairs'),
  require('plugins.theme'),
  require('plugins.mini'),
})

