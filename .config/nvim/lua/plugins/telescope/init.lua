return {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  after = 'onedark.nvim',
  requires = {
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('plugins.telescope.config')
  end,
}
