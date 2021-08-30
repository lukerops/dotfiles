local M = {}

function M.setup()
  vim.g.nvim_tree_follow = 1
  vim.g.nvim_tree_indent_markers = 1
  vim.g.nvim_tree_git_hl = 1
  vim.g.nvim_tree_lsp_diagnostics = 1
  vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
  }

  -- keymaps
  local utils = require("utils")

  utils.nnoremap("nt", ":NvimTreeToggle<CR>")
  utils.nnoremap("ntr", ":NvimTreeRefresh<CR>")
end

return M