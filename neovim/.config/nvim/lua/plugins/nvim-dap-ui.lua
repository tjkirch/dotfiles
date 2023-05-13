return {
   'rcarriga/nvim-dap-ui',
   lazy=true,
   config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup({controls = {icons = {
         pause="pause", play="play", step_into="into", step_over="over", step_out="out",
         step_back="back", run_last="last", terminate="term"}}})
      -- Automatically open UI when debugging starts
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
   end
}
