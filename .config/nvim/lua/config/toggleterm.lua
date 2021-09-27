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

  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new({
    cmd = "lazygit",
    direction = "float",
    hidden = true,
  })
  
  function toggle_lazygit()
    lazygit:toggle()
  end

  utils.nnoremap("<leader>gt", "<cmd>lua toggle_lazygit()<CR>")
end

return M
