local set_keymap = vim.api.nvim_set_keymap

opt = {noremap = true}

set_keymap('n', '<leader>so', ':SymbolsOutline<CR>', opt)
