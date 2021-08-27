return {
  'lukas-reineke/indent-blankline.nvim',
  event = 'BufRead',
  branch = 'lua',
  setup = function()
    require('plugins.indent-blankline.config')
  end,
}
