vim.g.indent_blankline_char = '│'
vim.g.indent_blankline_show_first_indent_level = true
vim.g.indent_blankline_filetype_exclude = {
  -- 'dashboard',
  -- 'log',
  -- 'fugitive',
  -- 'gitcommit',
  -- 'packer',
  -- 'vimwiki',
  -- 'markdown',
  -- 'json',
  -- 'txt',
  -- 'help',
  -- 'NvimTree',
  -- 'Outline',
  -- 'git',
  -- 'TelescopePrompt',
  -- 'undotree',
  -- '' -- for all buffers without a file type

  -- files
  'markdown',

  -- plugins
  'packer',
  'NvimTree',
  'Outline',
  'UltestSummary',
  '' -- for all buffers without a file type
}

-- because lazy load indent-blankline so need readd this autocmd
-- vim.cmd('autocmd CursorMoved * IndentBlanklineRefresh')
