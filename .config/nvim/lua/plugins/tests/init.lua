local plugins = require('core.plugins')

plugins:add({
  'rcarriga/vim-ultest',
  cmd = {'Ultest', 'UltestNearest', 'UltestSummary', 'UltestOutput', 'UltestClear', 'UltestStop'},
  requires = {'vim-test/vim-test'},
  run = ':UpdateRemotePlugins',
  setup = function()
    require('plugins.tests.config').ultest()
    require('plugins.tests.keymap').ultest()
  end,
})