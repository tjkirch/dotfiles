-- Note: nvim-lspconfig is triggered by LSP-capable filetypes; the dependencies
-- are then automatically loaded to bring up a full LSP environment.
-- (If changing this filetypeslist, update the treesitter list, too.)
return {
   'neovim/nvim-lspconfig',
   lazy=true,
   ft = {"bash", "fish", "rust", "sh", "toml"},
   dependencies = {'jose-elias-alvarez/null-ls.nvim', 'gbrlsnchs/telescope-lsp-handlers.nvim', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-nvim-lsp-signature-help', 'nvim-treesitter/nvim-treesitter', 'j-hui/fidget.nvim'},
   config = function()
      -- Load larger, more general LSP config file
      vim.cmd [[runtime 90_lsp.vim]]
      -- TOML linting; null-ls only does formatting
      require'lspconfig'.taplo.setup{}
   end
}
