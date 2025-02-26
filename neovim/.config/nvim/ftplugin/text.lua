vim.wo.spell = true
vim.bo.spelllang = "en_us"

vim.wo.wrap = true

vim.bo.cindent = false
vim.bo.smartindent = false

-- More frequent undo markers
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", "?", "?<c-g>u")
vim.keymap.set("i", "!", "!<c-g>u")
vim.keymap.set("i", ",", ",<c-g>u")
