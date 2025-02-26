local sections = {
   lualine_a = { "mode" },
   lualine_b = { "branch", "diff", "diagnostics" },
   lualine_c = { "filename" },
   lualine_x = { "filetype", "encoding", "fileformat" },
   lualine_y = { "selectioncount", "searchcount" },
   lualine_z = { "location", "progress" }
}

return {
   "nvim-lualine/lualine.nvim",
   opts = {
      options = {
         icons_enabled = false,
      },
      sections = sections,
      inactive_sections = sections,
      extensions = { "lazy", "man", "nvim-dap-ui", "oil" },
   },
}
