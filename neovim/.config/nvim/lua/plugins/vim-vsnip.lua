return {
   'hrsh7th/vim-vsnip',
   lazy=false,
   config = function()
      vim.cmd [[
         " Snippet navigation, e.g. to jump between function params
         imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
         smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
         imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
         smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
         " Copy currently selected text as new snippet; paste afterward
         vnoremap <Leader>vs :VsnipYank KEYWORD <bar> VsnipOpen<CR>
      ]]
      -- Store vsnip files with neovim
      vim.g.vsnip_snippet_dir = vim.fn.stdpath('config') .. '/vsnip'
   end
}
