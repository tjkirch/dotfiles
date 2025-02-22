return {
   "hrsh7th/nvim-cmp",
   lazy = false,
   config = function()
      local cmp = require("cmp")
      cmp.setup({
         snippet = {
            expand = function(args)
               vim.fn["vsnip#anonymous"](args.body)
            end,
         },
         -- Mappings for controlling the completion popup
         mapping = {
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
         },
         -- Where to get completion options
         sources = {
            -- nvim-cmp source for vim-vsnip
            { name = "vsnip" },
            -- from language server
            { name = "nvim_lsp" },
            -- display function signatures with current parameter emphasized
            { name = "nvim_lsp_signature_help" },
            -- complete from live fish shell
            { name = "fish" },
            -- complete from filesystem paths
            {
               name = "path",
               option = { trailing_slash = true },
            },
         },
         window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
         },
      })
   end,
}
