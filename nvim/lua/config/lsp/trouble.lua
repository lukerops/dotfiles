local M = {}

function M.config()
  require("trouble").setup({})
end

function M.setup()
  local utils = require("utils")

  utils.nnoremap("<leader>tb", "<cmd>Trouble<cr>")
end

return M
