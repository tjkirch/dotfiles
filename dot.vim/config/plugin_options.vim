let g:lua_check_syntax = 0 " disable vim-lua-ftplugin checking
let g:lua_complete_omni = 1
let g:lua_internal = 0
let g:lua_complete_dynamic = 0

if exists(":QfResizeWindows")
   nnoremap <silent> <c-w>= :wincmd =<cr>:QfResizeWindows<cr>
endif

let g:ale_open_list = 1
let g:ale_list_window_size = 5
let g:ale_change_sign_column_color = 1
let g:ale_lint_on_text_changed = 0

let g:ale_linters = {'rust': ['cargo']}
let g:ale_rust_cargo_check_all_targets = 1
