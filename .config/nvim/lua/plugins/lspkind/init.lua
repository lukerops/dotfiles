return {
  'onsails/lspkind-nvim',
  disable = true,
  after = 'nvim-compe',
  config = function()
    require('plugins.lspkind.config')
  end,
}
