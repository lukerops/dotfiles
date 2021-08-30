local set_keymap = vim.api.nvim_set_keymap

-- tabs
set_keymap('n', '<leader>1', ':tabnext 1<cr>', {noremap = true, silent = true})
set_keymap('n', '<leader>2', ':tabnext 2<cr>', {noremap = true, silent = true})
set_keymap('n', '<leader>3', ':tabnext 3<cr>', {noremap = true, silent = true})
set_keymap('n', '<leader>4', ':tabnext 4<cr>', {noremap = true, silent = true})
set_keymap('n', '<leader>5', ':tabnext 5<cr>', {noremap = true, silent = true})
set_keymap('n', '<leader>6', ':tabnext 6<cr>', {noremap = true, silent = true})
set_keymap('n', '<leader>7', ':tabnext 7<cr>', {noremap = true, silent = true})
set_keymap('n', '<leader>8', ':tabnext 8<cr>', {noremap = true, silent = true})
set_keymap('n', '<leader>9', ':tabnext 9<cr>', {noremap = true, silent = true})
set_keymap('n', '<leader>0', ':tablast<cr>', {noremap = true, silent = true})
set_keymap('n', '<leader>tbn', ':tabnew<cr>', {noremap = true, silent = true})
