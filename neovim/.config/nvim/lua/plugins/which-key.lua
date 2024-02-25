return {
   'folke/which-key.nvim',
   lazy=false,
   --dependencies='mrjones2014/legendary.nvim',
   config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300

      -- A menu of plugin commands I use rarely that don't need dedicated keys
      local wk = require("which-key")
      wk.setup({})
      wk.register({
         ["<leader>l"] = {name = "LSP"},
         ["<leader>g"] = {name = "git"},
         ["<leader>t"] = {name = "Telescope fuzzy finders"},
         ["<leader>d"] = {name = "debugger"},
         ["<leader>."] = {
            name = "Rarities",
            b = {":Gitsigns toggle_current_line_blame<CR>", "git: Toggle current-line blame"},
            f = {":DiffviewFileHistory %<CR>", "git: Show file history"},
            B = {":DiffviewFileHistory<CR>", "git: Show branch history"},
            c = {":DiffConflicts<CR>", "git: Turn conflict markers into diff"},
            s = {":DiffviewOpen HEAD", "git: Open conflicts/diff sidebar"},
            t = {":DiffReview<CR>", "git: Review workspace changes in tabs"},
            T = {":DiffReview git staged --no-color -U5<CR>", "git: Review staged changes in tabs"},
            p = {":PatchReview PATCH", "git: Review changes in patch"},
            w = {":SudoWrite<CR>", "unix: sudo write"},
            d = {":RustDebuggables<CR>", "rust: Start debugger"},
            m = {":RustExpandMacro<CR>", "rust: Expand macro"},
            C = {":RustOpenCargo<CR>", "rust: Open Cargo.toml"},
            M = {":RustParentModule<CR>", "rust: Open parent module"},
            g = {":RustViewCrateGraph<CR>", "rust: View crate dependency graph"},
            --###NVIM0.10: d = { ":RustLsp debuggables<CR>", "rust: Start debugger" },
            --###NVIM0.10: m = { ":RustLsp expandMacro<CR>", "rust: Expand macro" },
            --###NVIM0.10: C = { ":RustLsp openCargo<CR>", "rust: Open Cargo.toml" },
            --###NVIM0.10: M = { ":RustLsp parentModule<CR>", "rust: Open parent module" },
            --###NVIM0.10: g = { ":RustLsp viewCrateGraph<CR>", "rust: View crate dependency graph" },
            u = {":UndotreeToggle<CR>", "vim: Undo tree"},
            D = {":Telescope dap commands<CR>", "debug: All debug commands"},
         }
      })
    end,
}
