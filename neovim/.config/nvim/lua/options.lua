-- Set comma as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.o.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.o.relativenumber = true
vim.o.numberwidth = 1

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = "a"
vim.o.mousemodel = "extend"

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
--vim.schedule(function()
--   vim.o.clipboard = "unnamedplus"
--end)

-- Enable break indent
--vim.o.breakindent = true
vim.o.cindent = true
vim.o.cinoptions = "l1,m1j1"
vim.o.shiftwidth = 3
vim.o.tabstop = 3
vim.o.expandtab = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
--vim.o.ignorecase = true
--vim.o.smartcase = true

-- Keep signcolumn on by default
--vim.o.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
--vim.o.splitright = true
--vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.o.list = true
vim.o.listchars = "tab:»·,trail:·,nbsp:␣,extends:→,precedes:↸"
vim.o.showbreak = "↘"

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Show which line your cursor is on
vim.o.cursorline = true
--vim.o.cursorcolumn = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 3
vim.o.sidescrolloff = 3

-- Completion
--vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.completeopt = "menu,noinsert,noselect,preview"
vim.o.wildignorecase = true
vim.o.wildmode = "list:longest"

-- Miscellaneous
vim.o.cpoptions = "F_"
vim.o.diffopt = "internal,filler,closeoff,vertical"
vim.o.foldlevelstart = 99
vim.o.hidden = true
vim.o.modeline = true
vim.o.report = 0
vim.o.scrollback = 100000
vim.o.shell = "bash"
vim.o.shortmess = "clmorFOST"
vim.o.switchbuf = "useopen"
vim.o.title = true
vim.o.visualbell = true
vim.o.winwidth = 83

-- Status column, i.e. the numbers and signs along the left of the window.
-- First, the fold column (%C) and sign column (%s), if enabled.
-- And then the line number.
-- %= means right aligned.
-- If virtnum is not 0, it's virtual text or a wrapped line; show nothing.
-- Otherwise, if the relative number is not zero (meaning it's not the current
-- line) then show the relative number.  Otherwise the absolute number.
vim.o.statuscolumn = '%C%s%=%{v:virtnum!=0?"":v:relnum?v:relnum:v:lnum} '

if vim.fn.executable("rg") then
   vim.o.grepprg = "rg --no-heading --vimgrep"
   vim.o.grepformat = "%f:%l:%c:%m"
end

-- vim: ts=3 sts=3 sw=3 et
