-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
return {
   "rose-pine/neovim",
   name = "rose-pine",
   lazy = false,
   priority = 1000, -- Make sure to load this before all the other start plugins.
   config = function()
      require("rose-pine").setup({
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
      vim.cmd.colorscheme("rose-pine-moon")
   end,
}

-- vim: ts=3 sts=3 sw=3 et
