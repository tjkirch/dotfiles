-- Telescope for finding files, LSP references, etc.
return {
   'nvim-telescope/telescope.nvim',
   branch = '0.1.x',
   dependencies={'nvim-telescope/telescope-fzf-native.nvim', 'stevearc/dressing.nvim'},
   lazy=true,
   keys={'<leader>t', '<leader><leader>', '<leader><space>'},
   config = function()
      require('telescope').setup({})
      -- Commonly used pickers
      vim.cmd [[
         nnoremap <leader><leader> <cmd>Telescope buffers<cr>
         nnoremap <leader><space> <cmd>Telescope git_files<cr>
         nnoremap <leader>tb <cmd>Telescope git_bcommits<cr>
         nnoremap <leader>tc <cmd>Telescope git_commits<cr>
         nnoremap <leader>td <cmd>Telescope diagnostics<cr>
         nnoremap <leader>tf <cmd>Telescope find_files<cr>
         nnoremap <leader>tg <cmd>Telescope live_grep<cr>
         nnoremap <leader>ts <cmd>Telescope lsp_document_symbols<cr>
         nnoremap <leader>tt <cmd>Telescope treesitter<cr>
         nnoremap <leader>t' <cmd>Telescope marks<cr>
      ]]
   end
}
