return {
   "gbrlsnchs/telescope-lsp-handlers.nvim",
   lazy = true,
   config = function()
      -- This lets it take over vim.lsp.buf.* (except code actions; TODO)
      require("telescope").load_extension("lsp_handlers")
   end,
}
