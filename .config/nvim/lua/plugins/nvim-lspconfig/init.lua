return {
  'neovim/nvim-lspconfig',
  event = 'BufReadPre',
  config = function()
    require('plugins.nvim-lspconfig.config')
  end,
}
