local M = {}

function M.config()
  require("lspkind").init({
    preset = "codicons",
  })
end

return M
