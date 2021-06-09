local set_keymap = vim.api.nvim_set_keymap

opt = {noremap = true}

set_keymap('n', 'nt', ':NvimTreeToggle<CR>', opt)
set_keymap('n', 'ntr', ':NvimTreeRefresh<CR>', opt)
