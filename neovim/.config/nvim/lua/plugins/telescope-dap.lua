return {
   'nvim-telescope/telescope-dap.nvim',
   lazy=true,
   config = function()
      require('telescope').load_extension('dap')
   end
}
