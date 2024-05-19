return {
   "mrcjkb/rustaceanvim",
   version = "^4",
   lazy = true,
   ft = "rust",
   config = function()
      local extension_path = vim.env.HOME .. "/.vscode/extensions/codelldb/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
      vim.g.rustaceanvim = {
         dap = { adapter = require("rustaceanvim.config").get_codelldb_adapter(codelldb_path, liblldb_path) },
      }
   end,
}
