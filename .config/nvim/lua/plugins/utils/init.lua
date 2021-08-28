local plugins = require('core.plugins')

plugins:add({
  'kyazdani42/nvim-tree.lua',
  cmd = {'NvimTreeToggle','NvimTreeOpen'},
  after = 'onedark.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  setup = function()
    require('plugins.utils.config').nvimTree()
    require('plugins.utils.keymap').nvimTree()
  end,
})

plugins:add({
  'akinsho/toggleterm.nvim',
  opt = false,
  -- cmd = {'ToggleTerm'},
  config = function()
    require('plugins.utils.config').toggleterm()
    require('plugins.utils.keymap').toggleterm()
  end,
})