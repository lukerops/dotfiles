return {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  requires = {
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('plugins.telescope.config')
  end,
}
