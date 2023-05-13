return {
   'mfussenegger/nvim-dap',
   lazy=true,
   dependencies={'nvim-dap-ui', 'theHamsta/nvim-dap-virtual-text', 'nvim-telescope/telescope-dap.nvim'},
   ft='rust',
   config = function()
      -- dap-ui provides controls for other things, but these I'd want commonly while editing
      vim.keymap.set('n', '<leader>db', function() require'dap'.toggle_breakpoint() end)
      vim.keymap.set('n', '<leader>dB', function() require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
      vim.keymap.set('n', '<leader>dc', function() require'dap'.continue() end)
   end
}
