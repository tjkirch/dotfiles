return {
   'hrsh7th/cmp-nvim-lsp',
   lazy=true,
   config = function()
      require("cmp_nvim_lsp").default_capabilities()
   end
}
