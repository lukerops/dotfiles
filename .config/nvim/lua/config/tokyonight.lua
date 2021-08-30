local M = {}

function M.config()
  -- vim.g.tokyonight_style = "day"
  -- vim.g.tokyonight_style = "night"
  vim.g.tokyonight_italic_functions = true

  vim.cmd[[colorscheme tokyonight]]
end

return M