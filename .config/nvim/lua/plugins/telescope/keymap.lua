local set_keymap = vim.api.nvim_set_keymap
local M = {}

function M.telescope()
  set_keymap('n', '<C-p>', '<cmd>Telescope find_files<CR>', {noremap = true, silent = true})
  set_keymap('n', '<M-C-F>', '<cmd>Telescope live_grep<CR>', {noremap = true, silent = true})
  set_keymap('n', '<leader>gts', '<cmd>Telescope git_status<CR>', {noremap = true, silent = true})
end

return M