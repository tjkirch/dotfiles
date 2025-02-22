-- Has to be set before lazy.nvim
vim.g.mapleader = ","

-- Install lazy.nvim if it's missing
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

-- Load plugins from lua files in the lua/plugins/ directory
require("lazy").setup("plugins", {
   rocks = {
      enabled = false,
   },
   ui = {
      -- Disable silly default bindings
      custom_keys = {
         ["<localleader>l"] = false,
         ["<localleader>t"] = false,
      }
   },
   change_detection = {
      -- Don't notify on plugin config change detection because it eats a
      -- keystroke which is awkward.
      notify = false,
   },
})
