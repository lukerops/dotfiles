local M = {}

function M.config()
  require("toggleterm").setup({})

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
  utils.nnoremap("<C-t>", ":ToggleTerm<CR>")
end

return M