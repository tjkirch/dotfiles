-- A menu of plugin commands I use rarely that don't need dedicated keys
return {
   'FeiyouG/command_center.nvim',
   lazy=false,
   dependencies = 'nvim-lua/plenary.nvim',
   config = function()
      require('telescope').load_extension('command_center')
      require('command_center').add({
         {category="git", desc="Toggle current-line blame", cmd=':Gitsigns toggle_current_line_blame<CR>'},
         {category="git", desc="Show file history", cmd=':DiffviewFileHistory %<CR>'},
         {category="git", desc="Show branch history", cmd=':DiffviewFileHistory<CR>'},
         {category="git", desc="Turn conflict markers into diff", cmd=':DiffConflicts<CR>'},
         {category="git", desc="Open conflicts/diff sidebar", cmd=':DiffviewOpen HEAD'},
         {category="git", desc="Review workspace changes in tabs", cmd=':DiffReview<CR>'},
         {category="git", desc="Review staged changes in tabs", cmd=':DiffReview git staged --no-color -U5<CR>'},
         {category="git", desc="Review changes in patch", cmd=':PatchReview PATCH'},
         {category="unix", desc="sudo write", cmd=':SudoWrite<CR>'},
         {category="rust", desc="Start debugger", cmd=':RustDebuggables<CR>'},
         {category="rust", desc="Expand macro", cmd=':RustExpandMacro<CR>'},
         {category="rust", desc="Open Cargo.toml", cmd=':RustOpenCargo<CR>'},
         {category="rust", desc="Open parent module", cmd=':RustParentModule<CR>'},
         {category="rust", desc="View crate dependency graph", cmd=':RustViewCrateGraph<CR>'},
         {category="vim", desc="Undo tree", cmd=':UndotreeToggle<CR>'},
         {category="debug", desc="All debug commands", cmd=':Telescope dap commands<CR>'},
      })
   end
}
