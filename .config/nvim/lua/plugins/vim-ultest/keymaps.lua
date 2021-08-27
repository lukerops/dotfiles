local set_keymap = vim.api.nvim_set_keymap

opt = {noremap = true, silent = true}

set_keymap('n', '<leader>tf', '<cmd>Ultest<CR>', opt)
set_keymap('n', '<leader>tn', '<cmd>UltestNearest<CR>', opt)
set_keymap('n', '<leader>to', '<cmd>UltestOutput<CR>', opt)
set_keymap('n', '<leader>ts', '<cmd>UltestSummary<CR>', opt)
