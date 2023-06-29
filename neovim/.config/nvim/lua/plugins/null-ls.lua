return {
   'jose-elias-alvarez/null-ls.nvim',
   lazy=true,
   config = function()
      -- Set up null-ls to run non-LSP linters
      local null_ls = require("null-ls")
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      null_ls.setup({
          sources = {
              null_ls.builtins.diagnostics.shellcheck,
              null_ls.builtins.code_actions.shellcheck,
              null_ls.builtins.formatting.taplo,
              -- null_ls.builtins.completion.vsnip, -- might conflict with cmp-vsnip?
              null_ls.builtins.diagnostics.fish,
              null_ls.builtins.formatting.fish_indent,
              null_ls.builtins.formatting.jq,
              null_ls.builtins.formatting.stylua,
          },
          -- format on save
          on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
             vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
             vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                   vim.lsp.buf.format({ bufnr = bufnr })
                end,
             })
             end
          end,
      })
   end
}
