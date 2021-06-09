return {
  'nvim-treesitter/nvim-treesitter',
  cmd = {'TSInstall','TSInstallInfo', 'TSUpdate'},
  event = 'BufRead',
  after = {'onedark.nvim', 'telescope.nvim'},
  run = 'TSUpdate',
  config = function()
    require('plugins.nvim-treesitter.config')
  end,
}
