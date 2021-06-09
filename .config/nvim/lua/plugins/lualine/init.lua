return {
  'hoob3rt/lualine.nvim',
  after = 'onedark.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('plugins.lualine.config')
  end,
}
