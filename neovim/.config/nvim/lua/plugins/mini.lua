-- Collection of various small independent plugins/modules
return {
   "echasnovski/mini.nvim",
   branch = "stable",
   config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require("mini.ai").setup({ n_lines = 500 })

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require("mini.surround").setup({
         mappings = {
            add = "csa",            -- Add surrounding in Normal and Visual modes
            delete = "csd",         -- Delete surrounding
            find = "csf",           -- Find surrounding (to the right)
            find_left = "csF",      -- Find surrounding (to the left)
            highlight = "csh",      -- Highlight surrounding
            replace = "csr",        -- Replace surrounding
            update_n_lines = "csn", -- Update `n_lines`
         },
      })

      -- Like unimpaired; adds ] and [ movements for many types of Vim objects.
      -- ]b for next buffer, ]w for next window, etc.
      require("mini.bracketed").setup()

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
   end,
}

-- vim: ts=3 sts=3 sw=3 et
