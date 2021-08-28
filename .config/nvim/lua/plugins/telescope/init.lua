local plugins = require('core.plugins')

plugins:add({
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  after = 'onedark.nvim',
  requires = {
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
  },
  setup = function()
    require('plugins.telescope.keymap').telescope()
  end,
  config = function()
    require('plugins.telescope.config').telescope()
  end,
})