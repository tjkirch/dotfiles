vim.cmd [[ let g:git_messenger_no_default_mappings = v:true ]]
return {
   'rhysd/git-messenger.vim',
   lazy=true,
   cmd = 'GitMessenger',
}
