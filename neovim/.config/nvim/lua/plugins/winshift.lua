return {
   'sindrets/winshift.nvim',
   lazy=true,
   keys = {
      -- Enter window movement mode
      {'<C-W>m', '<Cmd>WinShift<CR>'},
      -- Enter window swapping mode
      {'<C-W>s', '<Cmd>WinShift swap<CR>'}
   },
}
