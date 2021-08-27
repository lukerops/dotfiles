return {
  'ray-x/lsp_signature.nvim',
  event = 'BufReadPre',
  after = 'nvim-lspconfig',
  config = function()
    require('plugins.lspsignature.config')
  end,
}
