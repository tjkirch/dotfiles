--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update

require("lazy").setup({
   -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).

   -- NOTE: Plugins can also be added by using a table,
   -- with the first argument being the link and the following
   -- keys can be used to configure plugin behavior/loading/etc.
   --
   -- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
   --
   -- Alternatively, use `config = function() ... end` for full control over the configuration.
   -- If you prefer to call `setup` explicitly, use:
   --    {
   --        'lewis6991/gitsigns.nvim',
   --        config = function()
   --            require('gitsigns').setup({
   --                -- Your gitsigns configuration here
   --            })
   --        end,
   --    }

   -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
   --
   -- This is often very useful to both group configuration, as well as handle
   -- lazy loading plugins that don't need to be loaded immediately at startup.
   --
   -- For example, in the following configuration, we use:
   --  event = 'VimEnter'
   --
   -- which loads which-key before all the UI elements are loaded. Events can be
   -- normal autocommands events (`:help autocmd-events`).
   --
   -- Then, because we use the `opts` key (recommended), the configuration runs
   -- after the plugin has been loaded as `require(MODULE).setup(opts)`.

   -- NOTE: Plugins can specify dependencies.
   --
   -- The dependencies are proper plugin specifications as well - anything
   -- you do for a plugin at the top level, you can do for a dependency.
   --
   -- Use the `dependencies` key to specify the dependencies of a particular plugin

   -- Modular plugins - everything goes into lua/plugins/ directory.
   spec = {
      { import = "plugins" },
   },
   rocks = {
      enabled = false,
   },
   change_detection = {
      -- Don't notify on plugin config change detection because it eats a
      -- keystroke which is awkward.
      notify = false,
   },
   ui = {
      -- Disable silly default bindings
      custom_keys = {
         ["<localleader>l"] = false,
         ["<localleader>i"] = false,
         ["<localleader>t"] = false,
      },
      -- If you are using a Nerd Font: set icons to an empty table which will use the
      -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
      icons = vim.g.have_nerd_font and {} or {
         cmd = "⌘",
         config = "🛠",
         event = "📅",
         ft = "📂",
         init = "⚙",
         keys = "🗝",
         plugin = "🔌",
         runtime = "💻",
         require = "🌙",
         source = "📄",
         start = "🚀",
         task = "📌",
         lazy = "💤 ",
      },
   },
})

-- vim: ts=3 sts=3 sw=3 et
