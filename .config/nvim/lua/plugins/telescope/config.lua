local M = {}

function M.telescope()
  local config = {}

  require('telescope').setup({
    defaults = config,
  })
end

return M