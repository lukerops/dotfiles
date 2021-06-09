return {
  'lewis6991/gitsigns.nvim',
  after = 'onedark.nvim',
  requires = 'nvim-lua/plenary.nvim',
  config = function()
    require('plugins.gitsigns.config')
  end,
}
