local M = {}

function M.config()
  require("telescope").load_extension("dap")
end

return M