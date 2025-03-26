-- Autoformat
return {
   "stevearc/conform.nvim",
   event = { "BufWritePre" },
   cmd = { "ConformInfo" },
   -- keys = {
   --    {
   --       "<leader>f",
   --       function()
   --          require("conform").format({ async = true, lsp_format = "fallback" })
   --       end,
   --       mode = "",
   --       desc = "[F]ormat buffer",
   --    },
   -- },
   opts = {
      notify_on_error = true,
      format_on_save = function(bufnr)
         -- Disable "format_on_save lsp_fallback" for languages that don't
         -- have a well standardized coding style. You can add additional
         -- languages here or re-enable it for the disabled ones.
         --local disable_filetypes = { c = true, cpp = true }
         local disable_filetypes = {}

         if disable_filetypes[vim.bo[bufnr].filetype] then
            return nil
         else
            return {
               timeout_ms = 500,
               lsp_format = "fallback",
            }
         end
      end,
      -- Languages without an LSP, or where the LSP is incomplete
      formatters_by_ft = {
         awk = { "gawk" },
         bash = { "shfmt" },
         json = { "jq" },
         just = { "just" },
         sh = { "shfmt" },
         yaml = { "yamlfmt" },

         -- Conform can also run multiple formatters sequentially
         -- python = { "isort", "black" },
         --
         -- You can use 'stop_after_first' to run the first available formatter from the list
         -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
      formatters = {
         shfmt = {
            prepend_args = { "--indent", "3", "--binary-next-line" },
         },
      },
   },
}

-- vim: ts=3 sts=3 sw=3 et
