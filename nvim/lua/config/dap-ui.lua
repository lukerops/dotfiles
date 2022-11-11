local M = {}

function M.config()
  require("dapui").setup()
  
  --keymaps
  local utils = require("utils")
  
  utils.nnoremap("<leader>dbgui", "<cmd>lua require('dapui').toggle()<cr>")
  utils.nnoremap("<leader>dbgscp", "<cmd>lua require('dapui').float_element('scopes')<cr>")
end

return M