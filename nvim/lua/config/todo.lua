local M = {}

function M.config()
  require("todo-comments").setup({})
end

function M.setup()
  -- keymaps
  local utils = require("utils")

  utils.nnoremap("<leader>td", "<cmd>TodoTrouble<cr>")
end

return M