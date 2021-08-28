local set_keymap = vim.api.nvim_set_keymap
local M = {}

function M.ultest()
  set_keymap('n', '<leader>tf', '<cmd>Ultest<CR>', {noremap = true, silent = true})
  set_keymap('n', '<leader>tn', '<cmd>UltestNearest<CR>', {noremap = true, silent = true})
  set_keymap('n', '<leader>to', '<cmd>UltestOutput<CR>', {noremap = true, silent = true})
  set_keymap('n', '<leader>ts', '<cmd>UltestSummary<CR>', {noremap = true, silent = true})
end

return M