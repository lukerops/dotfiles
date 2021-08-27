return {
  'rcarriga/vim-ultest',
  cmd = {'Ultest', 'UltestNearest', 'UltestSummary', 'UltestOutput', 'UltestClear', 'UltestStop'},
  requires = {'vim-test/vim-test'},
  run = ':UpdateRemotePlugins',
  setup = function()
    require('plugins.vim-ultest.config')
  end,
}
