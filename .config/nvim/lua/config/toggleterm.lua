local M = {}

function M.config()
  require("toggleterm").setup({
    open_mapping = [[<C-t>]],
    size = function(term)
            if term.direction == 'horizontal' then
              return 15
            elseif term.direction == 'vertical' then
              return math.floor(vim.o.columns * 0.4)
            end
          end,
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
