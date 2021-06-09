require('plugins.nvim-compe.utils')

local set_keymap = vim.api.nvim_set_keymap

set_keymap('i', '<C-Space>', [[ compe#complete() ]], {noremap = true, silent = true, expr = true})
set_keymap('i', '<CR>', [[ compe#confirm('<CR>') ]], {noremap = true, silent = true, expr = true})
set_keymap('i', '<C-e>', [[ compe#close('<C-e>') ]], {noremap = true, silent = true, expr = true})

-- see utils.lua for tab_complete and s_tab_complete
set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
