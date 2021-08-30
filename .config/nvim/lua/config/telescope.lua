local M = {}

function M.config()
  local config = {}

  require("telescope").setup({
    defaults = config,
  })
end

function M.setup()
  local utils = require("utils")
  
  utils.nnoremap("<C-p>", "<cmd>Telescope find_files<CR>")
  utils.nnoremap("<M-C-F>", "<cmd>Telescope live_grep<CR>")
  utils.nnoremap("<leader>gts", "<cmd>Telescope git_status<CR>")
end

return M