return {
  'akinsho/nvim-bufferline.lua',
  after = 'onedark.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('plugins.bufferline.config')
  end,
}
