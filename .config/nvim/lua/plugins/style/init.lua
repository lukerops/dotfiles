local plugins = require('core.plugins')

plugins:add({
  'navarasu/onedark.nvim',
  config = function()
    require('plugins.style.config').onedark()
  end,
})

plugins:add({
  'akinsho/nvim-bufferline.lua',
  after = 'onedark.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('plugins.style.config').bufferline()
  end,
})

plugins:add({
  'hoob3rt/lualine.nvim',
  after = 'onedark.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('plugins.style.config').lualine()
  end,
})

plugins:add({
  'nvim-treesitter/nvim-treesitter',
  cmd = {'TSInstall','TSInstallInfo', 'TSUpdate'},
  event = 'BufRead',
  after = {'onedark.nvim', 'telescope.nvim'},
  run = 'TSUpdate',
  config = function()
    require('plugins.style.config').treesitter()
  end,
})