local set_keymap = vim.api.nvim_set_keymap

opt = {noremap = true, silent = true}

set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)

set_keymap('n', '<leader>ft', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)

