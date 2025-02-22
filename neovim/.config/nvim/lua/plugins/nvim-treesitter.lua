return {
   "nvim-treesitter/nvim-treesitter",
   build = ":TSUpdate",
   dependencies = {
      "HiPhish/rainbow-delimiters.nvim",
      "nvim-treesitter/nvim-treesitter-context",
   },
   lazy = true,
   config = function()
      --FIXME: how do I keep the list of filetypes in only one place, like nvim-lspconfig?
      vim.cmd([[
         " Treesitter-based folding, where available
         augroup treesitter
            autocmd!
            autocmd FileType bash,fish,rust,toml,lua,cpp setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr()
         augroup END
      ]])
      require("nvim-treesitter.configs").setup({
         ensure_installed = { "bash", "fish", "rust", "toml", "lua", "cpp" },
         auto_install = true,
         -- replace syntax highlighting / indentation with language-aware versions
         highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
         },
         indent = { enable = true },
         -- select text quickly based on language nodes/scopes
         incremental_selection = {
            enable = true,
            keymaps = {
               init_selection = "<CR>",
               scope_incremental = "<CR>",
               node_incremental = "<TAB>",
               node_decremental = "<S-TAB>",
            },
         },
      })
   end,
}
