-- Highlight, edit, and navigate code
return {
   "nvim-treesitter/nvim-treesitter",
   dependencies = {
      {
         "HiPhish/rainbow-delimiters.nvim",
         submodules = false,
      },
      {
         "nvim-treesitter/nvim-treesitter-context",
         opts = {
            min_window_height = 10,
            multiline_threshold = 10,
            mode = "topline",
         },
      },
   },
   build = ":TSUpdate",
   main = "nvim-treesitter.configs", -- Sets main module to use for opts
   -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
   opts = {
      ensure_installed = {
         "bash",
         "c",
         "cpp",
         "diff",
         "fish",
         "html",
         "lua",
         "luadoc",
         "markdown",
         "markdown_inline",
         "query",
         "rust",
         "toml",
         "vim",
         "vimdoc",
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
         enable = true,
         -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
         --  If you are experiencing weird indenting issues, add the language to
         --  the list of additional_vim_regex_highlighting and disabled languages for indent.
         additional_vim_regex_highlighting = { "ruby" },
      },
      indent = { enable = true, disable = { "ruby" } },
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
   },
   -- There are additional nvim-treesitter modules that you can use to interact
   -- with nvim-treesitter. You should go explore a few and see what interests you:
   --
   --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
   --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
   --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}

-- vim: ts=3 sts=3 sw=3 et
