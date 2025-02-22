vim.cmd([[ let g:git_messenger_no_default_mappings = v:true ]])
return {
   "rhysd/git-messenger.vim",
   lazy = true,
   keys = { { "<Leader>gb", "<cmd>GitMessenger<CR>", desc = "Git blame; twice to float; o/O commits; q close" } },
}
