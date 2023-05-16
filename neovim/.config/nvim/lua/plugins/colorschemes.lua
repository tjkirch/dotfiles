return {
   {
      -- jellybeans, but with modern plugin support, like LSP
      'themercorp/themer.lua',
      lazy=false,
      priority=1000,
      opts = {
         dim_inactive = true,
         --colorscheme = "jellybeans",
         colorscheme = "rose_pine_moon",
      },
   },
   {
      'rose-pine/neovim',
      name = "rose-pine",
      lazy=true,
      opts={
         dim_nc_background = true,
         disable_italics = true,
      },
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
                  tsrainbow2 = true,
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
            ts_rainbow2 = true,
            native_lsp = {
               enabled = true,
            },
         },
      },
   },
}
