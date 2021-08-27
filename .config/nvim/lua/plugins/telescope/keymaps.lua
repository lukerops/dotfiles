local set_keymap = vim.api.nvim_set_keymap

opt = {noremap = true, silent = true}

set_keymap('n', '<C-p>', '<cmd>Telescope find_files<CR>', opt)
set_keymap('n', '<M-C-F>', '<cmd>Telescope live_grep<CR>', opt)
set_keymap('n', '<M-C-G>', '<cmd>Telescope git_status<CR>', opt)
