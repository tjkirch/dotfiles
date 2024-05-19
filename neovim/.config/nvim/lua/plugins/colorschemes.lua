return {
   {
      -- jellybeans, but with modern plugin support, like LSP
      'themercorp/themer.lua',
      lazy=true,
      --priority=1000,
      config = function()
         require('themer').setup({
            dim_inactive = true,
            --colorscheme = "jellybeans",
            colorscheme = "rose_pine_moon",
         })
         vim.cmd('colorscheme themer_rose_pine_moon')
      end,
   },
   {
      'rose-pine/neovim',
      name = "rose-pine",
      lazy=false,
      priority=1000,
      config = function()
         require('rose-pine').setup({
            dim_nc_background = true,
            highlight_groups = {
               -- (Get these from lua/rose-pine/theme.lua)
               -- Don't make builtins e.g. 'self' such a bright red, but still
               -- have them stand out with italics.
               ["@variable.builtin"] = { fg = "rose", italic = true },
               ["@constant.builtin"] = { fg = "rose", italic = true },
               ["@function.builtin"] = { fg = "rose", italic = true },
               ["@function.macro"] = { fg = "iris", italic = true },
               -- Don't use so many italics elsewhere.  (Sadly, it seems I
               -- can't just override the italic property.)
               ["Comment"] = { fg = "muted", italic = false },
               ["mkdCode"] = { fg = "foam", italic = false },
               ["@parameter"] = { fg = "iris", italic = false },
               ["@property"] = { fg = "foam", italic = false },
               ["@variable"] = { fg = "text", italic = false },
            },
         })
         vim.cmd('colorscheme rose-pine-moon')
      end,
   },
   {
      'EdenEast/nightfox.nvim',
      lazy=true,
      --priority=1000,
      config=function()
         require('nightfox').setup({
            options = {
               dim_inactive = true,
               modules = {
                  cmp = true,
                  gitsigns = true,
                  hop = true,
                  native_lsp = true,
                  diagnostic = true,
                  telescope = true,
                  treesitter = true,
               },
            },
         })
         vim.cmd.colorscheme "nordfox"
      end
   },
   {
      'catppuccin/nvim',
      name = "catppuccin",
      lazy=true,
      opts={
         flavour = "catppuccin-mocha",
         show_end_of_buffer = true,
         dim_inactive = {
            enabled = true,
         },
         no_italic = true,
         integrations = {
            cmp = true,
            gitsigns = true,
            telescope = true,
            nvimtree = false,
            treesitter = true,
            rainbow_delimiters = true,
            native_lsp = {
               enabled = true,
            },
         },
      },
   },
}
