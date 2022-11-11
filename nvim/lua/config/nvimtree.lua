local M = {}

function M.setup()
  -- keymaps
  local utils = require("utils")

  utils.nnoremap("nt", ":NvimTreeToggle<CR>")
end

function M.config()
  local nvim_tree = require("nvim-tree")

  require'nvim-tree'.setup {
    filters = {
      dotfiles = false,
      custom = { "^\\.git$", "^node_modules$", "^\\.cache$", "^\\.pytest_cache$", "^\\.vscode$", "^__pycache__$" },
      exclude = {},
    },
  }
end

return M
