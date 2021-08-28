local plugins = require('core.plugins')

plugins:add({
  'lewis6991/gitsigns.nvim',
  after = 'onedark.nvim',
  requires = 'nvim-lua/plenary.nvim',
  config = function()
    require('plugins.git.config').gitsigns()
  end,
})

plugins:add({
  'sindrets/diffview.nvim',
  config = function()
    require('plugins.git.config').diffview()
    require('plugins.git.keymap').diffview()
  end,
})