return {
   'simrat39/rust-tools.nvim',
   lazy=true,
   ft='rust',
   config = function()
      local extension_path = vim.env.HOME .. '/.vscode/extensions/codelldb/extension/'
      local codelldb_path = extension_path .. 'adapter/codelldb'
      local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
      require("rust-tools").setup({
         server = { settings = { ["rust-analyzer"] = { checkOnSave = { command = "clippy" }}}},
         dap = { adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path) },
      })
   end,
}
