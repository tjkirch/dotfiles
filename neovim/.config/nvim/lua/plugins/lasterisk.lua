return {
   "rapan931/lasterisk.nvim",
   config = function()
      vim.keymap.set("n", "*", function()
         require("lasterisk").search()
      end)
      vim.keymap.set("n", "g*", function()
         require("lasterisk").search({ is_whole = false })
      end)
      vim.keymap.set("x", "g*", function()
         require("lasterisk").search({ is_whole = false })
      end)
   end,
}
