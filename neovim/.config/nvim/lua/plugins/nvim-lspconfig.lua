-- Note: nvim-lspconfig is triggered by LSP-capable filetypes; the dependencies
-- are then automatically loaded to bring up a full LSP environment.
-- (If changing this filetypeslist, update the treesitter list, too.)
return {
   'neovim/nvim-lspconfig',
   lazy=true,
   ft = {"bash", "fish", "rust", "sh", "toml", "lua"},
   dependencies = {
      'jose-elias-alvarez/null-ls.nvim',
      'gbrlsnchs/telescope-lsp-handlers.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'nvim-treesitter/nvim-treesitter',
      'j-hui/fidget.nvim'
   },
   config = function()
      -- Load larger, more general LSP config file
      vim.cmd [[runtime 90_lsp.vim]]
      -- Rust is set up by rust-tools.lua
      -- TOML linting; null-ls only does formatting
      require'lspconfig'.taplo.setup{}
      -- lua-language-server
      require'lspconfig'.lua_ls.setup{
         settings = {
            -- Note: these settings can be configured per Lua project with a .lurarc.json at its root
            Lua = {
               diagnostics = {
                  globals = {'vim'}
               },
               runtime = {
                  version = 'Lua 5.4',
               },
               telemetry = {
                  enable = false
               }
            }
         }
      }
   end
}
