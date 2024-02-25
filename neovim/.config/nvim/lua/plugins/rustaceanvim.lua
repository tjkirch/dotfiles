-- Note: this replaces rust-tools, but removed inlay hints, which I need.
-- Those are being added to neovim 0.10, so I can switch to this then.
-- Guide: https://vinnymeller.com/posts/neovim_nightly_inlay_hints/

return {}
--return {
--   "mrcjkb/rustaceanvim",
--   version = "^4",
--   lazy = true,
--   ft = "rust",
--   config = function()
--      local extension_path = vim.env.HOME .. "/.vscode/extensions/codelldb/extension/"
--      local codelldb_path = extension_path .. "adapter/codelldb"
--      local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
--      vim.g.rustaceanvim = {
--         dap = { adapter = require("rustaceanvim.config").get_codelldb_adapter(codelldb_path, liblldb_path) },
--      }
--   end,
--}
