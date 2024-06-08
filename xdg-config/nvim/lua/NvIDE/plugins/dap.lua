return {
  "mfussenegger/nvim-dap",
  dependencies = { "rcarriga/nvim-dap-ui", "mfussenegger/nvim-dap-python", },
  keys = {
    -- { "<F5>",          function() require("dap").continue() end,          desc = "Debug Continue" },
    -- { "<F10>",         function() require("dap").step_over() end,         desc = "Debug StepOver" },
    -- { "<F11>",         function() require("dap").step_into() end,         desc = "Debug StepInto" },
    -- { "<C-F11>",       function() require("dap").step_out() end,          desc = "Debug StepOut" },
    -- { "<C-F5>",        function() require("dap").step_out() end,          desc = "Debug Stop" },
    { "<leader>dbgbk", function() require("dap").toggle_breakpoint() end, desc = "Debug Toggle Breakpoint" },
    { "<leader>dbgh",  function() require("dap.ui.widgets").hover() end,  desc = "Debug Hover" },
  },
  lazy = true,
  config = function()
    -- configura o dap para o python
    require("dap-python").setup(vim.fn.expand("$XDG_DATA_HOME/nvim/mason/packages/debugpy/venv/bin/python3"))

    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}
