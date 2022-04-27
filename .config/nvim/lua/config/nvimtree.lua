local M = {}

function M.setup()
  vim.g.nvim_tree_indent_markers = 1
  vim.g.nvim_tree_git_hl = 1
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
end

function M.config()
  local nvim_tree = require("nvim-tree")
  nvim_tree.setup({
    update_cwd = true,
    diagnostics = {
      enable = true,
    },
    update_focused_file = {
      enable = true,
      update_cwd = false,
    },
    filters = {
      custom = {
        ".git",
        "node_modules",
        ".cache",
        ".pytest_cache",
        ".vscode",
        "__pycache__",
      },
    },
    git = {
      ignore = false,
    },
    view = {
      hide_root_folder = true,
      auto_resize = true,
    },
  })
end

return M
