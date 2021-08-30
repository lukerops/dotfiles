local M = {}

function M.setup()
  vim.g.nvim_tree_ignore = {
    ".git",
    "node_modules",
    ".cache",
    ".pytest_cache",
    ".vscode",
    "__pycache__",
  }
  vim.g.nvim_tree_follow = 1
  vim.g.nvim_tree_indent_markers = 1
  vim.g.nvim_tree_git_hl = 1
  vim.g.nvim_tree_tab_open = 1
  vim.g.nvim_tree_lsp_diagnostics = 1
  vim.g.nvim_tree_window_picker_exclude = {
    filetype = {
      "packer",
      "UltestSummary",
      "DiffviewFiles",
      "Trouble",
    },
    buftype = {
      "terminal"
    }
  }
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