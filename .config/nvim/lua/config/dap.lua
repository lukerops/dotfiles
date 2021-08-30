local M = {}

function M.config()
  local dap = require("dap")
  dap.adapters.python = {
    type = "executable";
    command = "/usr/local/bin/python";
    args = { "-m", "debugpy.adapter" };
  }

  -- keymaps
  local utils = require("utils")

  utils.nnoremap("<leader>dbgbk", "<cmd>lua require('dap').toggle_breakpoint()<cr>")
  utils.nnoremap("<F5>",    "<cmd>lua require('dap').continue()<cr>")
  utils.nnoremap("<F10>",   "<cmd>lua require('dap').step_over()<cr>")
  utils.nnoremap("<F11>",   "<cmd>lua require('dap').step_into()<cr>")
  utils.nnoremap("<C-F11>", "<cmd>lua require('dap').step_out()<cr>")
  utils.nnoremap("<C-F5>", "<cmd>lua require('dap').stop()<cr>")
  utils.nnoremap("<leader>dbgh", "<cmd>lua require('dap.ui.widgets').hover()<cr>")
  utils.nnoremap("<leader>dbgsc", "<cmd>lua local widgets = require('dap.ui.widgets'); widgets.centered_float(widgets.scopes)<cr>")
end

return M