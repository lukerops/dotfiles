local set_keymap = vim.api.nvim_set_keymap
local M = {}

function M.nvimTree()
  set_keymap('n', 'nt', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
  set_keymap('n', 'ntr', ':NvimTreeRefresh<CR>', {noremap = true})
end

function M.toggleterm()
  local Terminal = require('toggleterm.terminal').Terminal
  local lazygit = Terminal:new({
    cmd = 'lazygit',
    direction = 'float',
    hidden = true,
  })
  
  function togleLazygit()
    lazygit:toggle()
  end

  set_keymap('n', '<leader>gt', '<cmd>lua togleLazygit()<CR>', {noremap = true, silent = true})
  set_keymap('n', '<C-t>', ':ToggleTerm<CR>', {noremap = true, silent = true})
end

return M
