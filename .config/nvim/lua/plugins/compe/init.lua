return {
  'hrsh7th/nvim-compe',
  event = 'InsertEnter',
  after = 'nvim-lspconfig',
  requires = 'norcalli/snippets.nvim',
  config = function()
    require('plugins.compe.config')
  end,
}
