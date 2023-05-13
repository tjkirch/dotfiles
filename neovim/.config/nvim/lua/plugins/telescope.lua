-- Telescope for finding files, LSP references, etc.
return {
   'nvim-telescope/telescope.nvim',
   branch = '0.1.x',
   dependencies={'nvim-telescope/telescope-fzf-native.nvim'},
   lazy=false,
   config = function()
      local c = require("command_center").component
      require('telescope').setup({
         extensions = {
            command_center = { components = { c.CATEGORY, c.DESC, c.CMD } },
         }
      })
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
         nnoremap <leader>cc <cmd>Telescope command_center<cr>
         " command center is for when I can't remember, so...
         nnoremap <leader> <cmd>Telescope command_center<cr>
      ]]
   end
}
