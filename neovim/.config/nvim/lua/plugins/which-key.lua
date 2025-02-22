return {
   "folke/which-key.nvim",
   lazy = false,
   --dependencies='mrjones2014/legendary.nvim',
   config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300

      -- A menu of plugin commands I use rarely that don't need dedicated keys
      local wk = require("which-key")
      wk.add({
         { "<leader>.",  group = "Rarities" },
         { "<leader>.B", ":DiffviewFileHistory<CR>",                  desc = "git: Show branch history" },
         { "<leader>.C", ":RustLsp openCargo<CR>",                    desc = "rust: Open Cargo.toml" },
         { "<leader>.M", ":RustLsp parentModule<CR>",                 desc = "rust: Open parent module" },
         { "<leader>.T", ":DiffReview git staged --no-color -U5<CR>", desc = "git: Review staged changes in tabs" },
         { "<leader>.b", ":Gitsigns toggle_current_line_blame<CR>",   desc = "git: Toggle current-line blame" },
         {
            "<leader>.c",
            ":DiffConflicts<CR>",
            desc = "git: Turn conflict markers into diff",
         },
         { "<leader>.d", ":RustLsp debuggables<CR>",    desc = "rust: Start debugger" },
         { "<leader>.f", ":DiffviewFileHistory %<CR>",  desc = "git: Show file history" },
         { "<leader>.g", ":RustLsp viewCrateGraph<CR>", desc = "rust: View crate dependency graph" },
         { "<leader>.m", ":RustLsp expandMacro<CR>",    desc = "rust: Expand macro" },
         { "<leader>.p", ":PatchReview PATCH",          desc = "git: Review changes in patch" },
         { "<leader>.s", ":DiffviewOpen HEAD",          desc = "git: Open conflicts/diff sidebar" },
         {
            "<leader>.t",
            ":DiffReview<CR>",
            desc = "git: Review workspace changes in tabs",
         },
         { "<leader>.u", ":UndotreeToggle<CR>",            desc = "vim: Undo tree" },
         { "<leader>.w", ":SudoWrite<CR>",                 desc = "unix: sudo write" },
         { "<leader>d",  group = "debugger" },
         { "<leader>g",  group = "git" },
         { "<leader>l",  group = "LSP" },
         { "<leader>t",  group = "Telescope fuzzy finders" },
      })
   end,
}
