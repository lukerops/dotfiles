return {
  'lukas-reineke/indent-blankline.nvim',
  event = 'BufRead',
  branch = 'lua',
  config = function()
    require('plugins.indent-blankline.config')
  end,
}
