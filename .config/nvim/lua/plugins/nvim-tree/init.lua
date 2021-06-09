return {
  'kyazdani42/nvim-tree.lua',
  cmd = {'NvimTreeToggle','NvimTreeOpen'},
  after = 'onedark.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('plugins.nvim-tree.config')
  end,
}
