return {
   "stevearc/dressing.nvim",
   lazy = true,
   opts = {
      -- I dislike its transparency
      input = { win_options = { winblend = 0 } },
      select = { builtin = { win_options = { winblend = 0 } } },
   },
}
