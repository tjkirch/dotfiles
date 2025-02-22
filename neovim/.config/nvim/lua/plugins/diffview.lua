return {
   "sindrets/diffview.nvim",
   lazy = true,
   cmd = {
      "DiffviewFileHistory",
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
   },
   opts = {
      use_icons = false,
      signs = { fold_closed = "x", fold_open = "-" },
      default_args = { DiffviewOpen = { "--untracked-files=no" } },
   },
}
