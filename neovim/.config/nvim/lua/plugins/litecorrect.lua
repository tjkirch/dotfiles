return {
   "preservim/vim-litecorrect",
   ft = { "markdown", "text" },
   config = function()
      vim.fn["litecorrect#init"]()
   end,
}
