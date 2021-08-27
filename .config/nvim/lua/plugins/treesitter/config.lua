local configs = require('nvim-treesitter.configs')

configs.setup({
  ensure_installed = {
    'go', 'javascript',
    'python', 'graphql',
    'json', 'yaml',
    'lua',
  },
  highlight = {
    enable = true,
  },
  -- incremental_selection = { enable = true },
})
