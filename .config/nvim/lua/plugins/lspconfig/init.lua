return {
  'neovim/nvim-lspconfig',
  event = 'BufReadPre',
  after = 'onedark.nvim',
  config = function()
    require('plugins.lspconfig.config')
  end,
}
