-- Install packer if it's missing
local ensure_packer = function()
   local fn = vim.fn
   local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
   if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
      vim.cmd [[packadd packer.nvim]]
      return true
   end
   return false
end
local packer_bootstrap = ensure_packer()

-- Automatically recompile plugins file on change
vim.cmd([[
   augroup packer_user_config
      autocmd!
      autocmd BufWritePost 00_plugins.lua source <afile> | PackerCompile
   augroup end
]])

-- Set up my plugins
return require('packer').startup(function(use)
   use {'wbthomason/packer.nvim'}


   -- git/diff-related  =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=

   use {'whiteinge/diffconflicts', cmd = 'DiffConflicts' }
   use {'sindrets/diffview.nvim', config = function()
      require'diffview'.setup {
        use_icons = false,
        signs = { fold_closed = "x", fold_open = "-" },
        default_args = { DiffviewOpen = { "--untracked-files=no" } },
      }
   end}
   use {'junkblocker/patchreview-vim', cmd = {'DiffReview', 'PatchReview', 'ReversePatchReview'} }
   use {'tpope/vim-fugitive'}
   use {'rhysd/git-messenger.vim', cmd = 'GitMessenger', config = function() vim.cmd [[
      " git blame; hit twice to go into floating window, o and O to navigate commits, q to close
      let g:git_messenger_no_default_mappings = v:true
      nmap <Leader>gb :GitMessenger<CR>
   ]] end}
   use {'lewis6991/gitsigns.nvim', config = function()
      require('gitsigns').setup {
         current_line_blame = false,
         current_line_blame_opts = { virt_text_pos = 'right_align', delay = 250, },
         signs = { add = { text = '+' }, change = { text = '~' } },
      }
   end}


   -- system integration         =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=

   use {'ConradIrwin/vim-bracketed-paste'}
   use {'tpope/vim-eunuch'}


   -- language-specific          =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=

   use {'dag/vim-fish', ft = 'fish' }
   use {'mechatroner/rainbow_csv', ft = 'csv' }
   use {'jsborjesson/vim-uppercase-sql', ft = 'sql' }
   use {'simrat39/rust-tools.nvim', after = "nvim-lspconfig", config = function()
      local extension_path = vim.env.HOME .. '/.vscode/extensions/codelldb/extension/'
      local codelldb_path = extension_path .. 'adapter/codelldb'
      local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
      require("rust-tools").setup({
         server = { settings = { ["rust-analyzer"] = { checkOnSave = { command = "clippy" }}}},
         dap = { adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path) },
      })
   end}


   -- movement helpers  =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=

   use {'tpope/vim-unimpaired'}
   use {'phaazon/hop.nvim', config = function()
      require('hop').setup()
      vim.cmd [[
         " Quick movement to other lines
         nnoremap `/ :HopPatternMW<CR>
         nnoremap `a :HopAnywhereMW<CR>
         nnoremap `c :HopChar1MW<CR>
         nnoremap `l :HopLineMW<CR>
         nnoremap `w :HopWordMW<CR>
      ]]
   end}
   use {'zirrostig/vim-schlepp', config = function() vim.cmd [[
      " Move visually selected text around with arrows
      vmap <up>    <Plug>SchleppUp
      vmap <down>  <Plug>SchleppDown
      vmap <left>  <Plug>SchleppLeft
      vmap <right> <Plug>SchleppRight
   ]] end}
   use {'inside/vim-search-pulse', config = "vim.g.vim_search_pulse_mode='pattern'"}
   use {'sindrets/winshift.nvim', config = function() vim.cmd [[
      " Enter window movement mode
      nnoremap <C-W>m <Cmd>WinShift<CR>
      " Enter window swapping mode
      nnoremap <C-W>s <Cmd>WinShift swap<CR>
   ]] end}


   -- editing helpers   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=

   use {'AndrewRadev/splitjoin.vim'}  -- gS to split one-liner, gJ to join block into one line
   use {'tpope/vim-abolish'}  -- expand abbreviations, and :Subvert for expanded substitutions
   use {'vim-scripts/ReplaceWithRegister'}  -- "gr" to replace with contents of given register
   use {'tpope/vim-surround'}  -- cs, ds, ys to change, delete, add surrounding delimeters
   use {'machakann/vim-swap'}  -- g< and g> to move delimited arguments left and right
   use {'tomtom/tcomment_vim'}  -- gc to comment/uncomment


   -- search/file helpers        =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=

   use {'mbbill/undotree'}
   use {'tpope/vim-vinegar'}  -- improves built-in netrw file explorer
   -- Telescope for finding files, LSP references, etc.
   use {'nvim-telescope/telescope.nvim', branch = '0.1.x', config = function()
      local c = require("command_center").component
      require('telescope').setup({
         extensions = {
            command_center = { components = { c.CATEGORY, c.DESC, c.CMD } },
         }
      })
      -- Commonly used pickers
      vim.cmd [[
         nnoremap <leader><leader> <cmd>Telescope buffers<cr>
         nnoremap <leader><space> <cmd>Telescope git_files<cr>
         nnoremap <leader>tb <cmd>Telescope git_bcommits<cr>
         nnoremap <leader>tc <cmd>Telescope git_commits<cr>
         nnoremap <leader>td <cmd>Telescope diagnostics<cr>
         nnoremap <leader>tf <cmd>Telescope find_files<cr>
         nnoremap <leader>tg <cmd>Telescope live_grep<cr>
         nnoremap <leader>ts <cmd>Telescope lsp_document_symbols<cr>
         nnoremap <leader>tt <cmd>Telescope treesitter<cr>
         nnoremap <leader>t' <cmd>Telescope marks<cr>
         nnoremap <leader>cc <cmd>Telescope command_center<cr>
         " command center is for when I can't remember, so...
         nnoremap <leader> <cmd>Telescope command_center<cr>
      ]]
   end}
   -- A menu of plugin commands I use rarely that don't need dedicated keys
   use {'FeiyouG/command_center.nvim', config = function()
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
   end}
   use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make', config = function()
      -- Fast searching with native extension
      require('telescope').load_extension('fzf')
   end}


   -- completion/correction      =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=

   use {'tpope/vim-endwise'}  -- automatically adds ending structures
   use {'preservim/vim-litecorrect', ft = {'markdown', 'text'}, config = function()
      vim.cmd [[call litecorrect#init()]]
   end}
   use {'hrsh7th/nvim-cmp', config = function()
      local cmp = require'cmp'
      cmp.setup({
        snippet = { expand = function(args) vim.fn["vsnip#anonymous"](args.body) end, },
        -- Mappings for controlling the completion popup
        mapping = {
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
        -- Where to get completion options
        sources = {
          { name = 'vsnip' },  -- nvim-cmp source for vim-vsnip
          { name = 'nvim_lsp' },  -- from language server
          { name = 'nvim_lsp_signature_help'},  -- display function signatures with current parameter emphasized
          { name = 'fish'},  -- complete from live fish shell
          { name = 'path', option = {trailing_slash = true}},  -- complete from filesystem paths
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
      })
   end}
   -- snippet support
   use {'hrsh7th/vim-vsnip', config = function()
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
   end}
   use {'hrsh7th/cmp-vsnip'}  -- completion of snippets
   use {'rafamadriz/friendly-snippets'}  -- common snippets
   use {'mtoohey31/cmp-fish'}  -- completion in fish scripts from a fish shell
   use {'hrsh7th/cmp-path'}  -- completion of filesystem paths


   -- color schemes     =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=

   -- jellybeans, but with modern plugin support, like LSP
   use({'themercorp/themer.lua', config = function() require("themer").setup({
      colorscheme = "jellybeans",
   }) end })


   -- miscellaneous / dependencies        =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=

   use {'nvim-lua/plenary.nvim'}
   use {'tpope/vim-repeat'}


   -- LSP setup         =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=

   -- Note: nvim-lspconfig is triggered by LSP-capable filetypes; the others are then
   -- automatically loaded with 'after' statements.
   -- (If changing this list, update the treesitter list below, too.)
   use {'neovim/nvim-lspconfig', ft = {"bash", "fish", "rust", "sh", "toml"}, config = function()
      -- Load larger, more general LSP config file
      vim.cmd [[runtime 90_lsp.vim]]
      -- TOML linting; null-ls only does formatting
      require'lspconfig'.taplo.setup{}
   end}
   use {'jose-elias-alvarez/null-ls.nvim', after = "nvim-lspconfig", config = function()
      -- Set up null-ls to run non-LSP linters
      local null_ls = require("null-ls")
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      null_ls.setup({
          sources = {
              null_ls.builtins.diagnostics.shellcheck,
              null_ls.builtins.code_actions.shellcheck,
              null_ls.builtins.formatting.taplo,
              null_ls.builtins.code_actions.gitsigns,
              -- null_ls.builtins.completion.vsnip, -- might conflict with cmp-vsnip?
              null_ls.builtins.diagnostics.fish,
              null_ls.builtins.formatting.fish_indent,
              null_ls.builtins.formatting.jq,
          },
          -- format on save
          on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
             vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
             vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                   vim.lsp.buf.format({ bufnr = bufnr })
                end,
             })
             end
          end,
      })
   end}
   use {'gbrlsnchs/telescope-lsp-handlers.nvim', after = "nvim-lspconfig", config = function()
      -- This lets it take over vim.lsp.buf.* (except code actions; TODO)
      require('telescope').load_extension('lsp_handlers')
   end}
   use {'hrsh7th/cmp-nvim-lsp', after = "nvim-lspconfig", config = function()
      require("cmp_nvim_lsp").default_capabilities()
   end}
   use {'hrsh7th/cmp-nvim-lsp-signature-help', after = "nvim-lspconfig"}


   -- Treesitter        =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=

   use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', after = "nvim-lspconfig", config = function()
      --FIXME: how do I keep the list of filetypes in only one place, just above, not here?
      vim.cmd [[
         " Treesitter-based folding, where available
         augroup treesitter
            autocmd!
            autocmd FileType bash,fish,rust,toml setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr()
         augroup END
      ]]
      require('nvim-treesitter.configs').setup {
         ensure_installed = { "bash", "fish", "rust", "toml" },
         auto_install = true,
         -- replace syntax highlighting / indentation with language-aware versions
         highlight = {
            enable = true,
            additional_vim_regex_highlighting=false,
         },
         indent = { enable = true },
         -- select text quickly based on language nodes/scopes
         incremental_selection = {
            enable = true,
            keymaps = {
               init_selection = '<CR>', scope_incremental = '<CR>',
               node_incremental = '<TAB>', node_decremental = '<S-TAB>',
            },
         },
         -- rainbow parens/brackets from nvim-ts-rainbow
         rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = 50000,
         }
      }
   end}
   use {'p00f/nvim-ts-rainbow', after = "nvim-treesitter"}


   -- debugging         =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=   =^..^=

   use {'mfussenegger/nvim-dap', ft = {'rust'}, config = function()
      -- dap-ui provides controls for other things, but these I'd want commonly while editing
      vim.keymap.set('n', '<leader>db', function() require'dap'.toggle_breakpoint() end)
      vim.keymap.set('n', '<leader>dB', function() require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
      vim.keymap.set('n', '<leader>dc', function() require'dap'.continue() end)
   end}
   use({'rcarriga/nvim-dap-ui', after = "nvim-dap", config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup({controls = {icons = {
         pause="pause", play="play", step_into="into", step_over="over", step_out="out",
         step_back="back", run_last="last", terminate="term"}}})
      -- Automatically open UI when debugging starts
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
   end})
   use {'theHamsta/nvim-dap-virtual-text', after = "nvim-dap", config = function() require("nvim-dap-virtual-text").setup() end}
   use {'nvim-telescope/telescope-dap.nvim', after = "nvim-dap", config = function()
      require('telescope').load_extension('dap')
   end}


   -- Automatically set up configuration after bootstrapping packer.nvim
   if packer_bootstrap then
      require('packer').sync()
   end
end)
