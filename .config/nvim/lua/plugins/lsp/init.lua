local plugins = require('core.plugins')

plugins:add({
  'neovim/nvim-lspconfig',
  event = 'BufReadPre',
  -- after = 'onedark.nvim',
  config = function()
    require('plugins.lsp.config').lspconfig()
    require('plugins.lsp.keymap').lspconfig()
  end,
})

plugins:add({
  'hrsh7th/nvim-compe',
  event = 'InsertEnter',
  after = 'nvim-lspconfig',
  requires = 'norcalli/snippets.nvim',
  config = function()
    require('plugins.lsp.config').compe()
    require('plugins.lsp.keymap').compe()
  end,
})

plugins:add({
  'ray-x/lsp_signature.nvim',
  after = 'nvim-lspconfig',
  config = function()
    require('plugins.lsp.config').lspsignature()
  end,
})