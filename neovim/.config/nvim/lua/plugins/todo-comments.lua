-- Highlight todo, notes, etc in comments
return {
   "folke/todo-comments.nvim",
   event = "VimEnter",
   dependencies = { "nvim-lua/plenary.nvim" },
   opts = { signs = false },
}

-- vim: ts=3 sts=3 sw=3 et
