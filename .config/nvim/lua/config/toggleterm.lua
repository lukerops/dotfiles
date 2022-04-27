local M = {}

function M.config()
  require("toggleterm").setup({
    open_mapping = [[<C-t>]],
    direction = 'float',
    float_opts = {
      border = 'curved',
    },
  })

  -- keymaps
  local utils = require("utils")
  local terminal = require("toggleterm.terminal").Terminal

  -- Lazygit
  local lazygit = terminal:new({
    cmd = "lazygit",
    direction = "float",
    hidden = true,
  })

  function toggle_lazygit()
    lazygit:toggle()
  end

  utils.nnoremap("<leader>gt", "<cmd>lua toggle_lazygit()<CR>")

  -- Git Graph
  local gitgraph = terminal:new({
    cmd = "git log --graph --pretty=short --all",
    direction = "float",
    hidden = true,
  })

  function toggle_gitgraph()
    gitgraph:toggle()
  end

  utils.nnoremap("<leader>gtg", "<cmd>lua toggle_gitgraph()<CR>")
end

return M
