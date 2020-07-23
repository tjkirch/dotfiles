let g:lua_check_syntax = 0 " disable vim-lua-ftplugin checking
let g:lua_complete_omni = 1
let g:lua_internal = 0
let g:lua_complete_dynamic = 0

if exists(":QfResizeWindows")
   nnoremap <silent> <c-w>= :wincmd =<cr>:QfResizeWindows<cr>
endif

let g:vim_search_pulse_mode = 'pattern'

let g:ale_open_list = 1
let g:ale_list_window_size = 5
let g:ale_change_sign_column_color = 1
let g:ale_lint_on_text_changed = 0

let g:ale_linters = {'python': ['flake8'], 'rust': ['cargo']}
let g:ale_rust_cargo_check_all_targets = 1
"""let g:ale_linters = {'python': ['flake8'], 'rust': ['rls']}
"""let g:ale_rust_rls_toolchain = 'stable'
"""let g:ale_rust_rls_config = {
"""   \   'rust': {
"""   \     'clippy_preference': 'on'
"""   \   }
"""   \ }

let g:ale_fixers = { 'rust': ['rustfmt'] }

" Stopped using LSP
"let g:ale_completion_enabled = 1

let g:ale_set_balloons = 1

" Higher than 10 takes priority over other plugins without a setting,
" which default to 10
let g:ale_sign_priority = 11

let g:racer_cmd = $HOME."/.cargo/bin/racer"
let g:racer_experimental_completer = 1
