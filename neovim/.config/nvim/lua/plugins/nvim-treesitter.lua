return {
   'nvim-treesitter/nvim-treesitter',
   build = ':TSUpdate',
   dependencies = 'HiPhish/nvim-ts-rainbow2',
   lazy=true,
   config = function()
      --FIXME: how do I keep the list of filetypes in only one place, just above, not here?
      vim.cmd [[
         " Treesitter-based folding, where available
         augroup treesitter
            autocmd!
            autocmd FileType bash,fish,rust,toml setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr()
         augroup END
      ]]
      require('nvim-treesitter.configs').setup {
         ensure_installed = { "bash", "fish", "rust", "toml" },
         auto_install = true,
         -- replace syntax highlighting / indentation with language-aware versions
         highlight = {
            enable = true,
            additional_vim_regex_highlighting=false,
         },
         indent = { enable = true },
         -- select text quickly based on language nodes/scopes
         incremental_selection = {
            enable = true,
            keymaps = {
               init_selection = '<CR>', scope_incremental = '<CR>',
               node_incremental = '<TAB>', node_decremental = '<S-TAB>',
            },
         },
         -- rainbow parens/brackets from nvim-ts-rainbow2
         rainbow = {
            enable = true,
            extended_mode = true,
            -- Which query to use for finding delimiters
            query = 'rainbow-parens',
         }
      }
   end
}
