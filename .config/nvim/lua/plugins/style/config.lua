local M = {}

function M.onedark()
  require('onedark').setup()
end

function M.bufferline()
  local config = {
    enforce_regular_tabs = true,
    --view = 'multiwindow',
    offsets = {
      {filetype = 'NvimTree', text = 'File Explorer', text_align = 'center'},
      {filetype = 'packer', text = 'Packer', text_align = 'center'},
      {filetype = 'Outline', text = 'File Symbols', text_align = 'center'},
      {filetype = 'UltestSummary', text = 'Tests Summary', text_align = 'center'},
      {filetype = 'DiffviewFiles', text = 'Git Diff', text_align = 'center'},
    },
    diagnostics = 'nvim_lsp',
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = ' '
      for e, n in pairs(diagnostics_dict) do
        local sym = e == 'error' and ' '
          or (e == 'warning' and ' ' or '' )
        s = s .. n .. sym
      end
      return s
    end
  }
  
  require('bufferline').setup({
    options = config,
  })
end

function M.lualine()
  require('lualine').setup({
    options = {
      icons_enabled = true,
      theme = 'onedark',
      component_separators = {'', ''},
      section_separators = {'', ''},
      disabled_filetypes = {
        'NvimTree',
	'packer',
	'UltestSummary',
	'DiffviewFiles',
	'Trouble',
      },
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {}
  })
end

function M.treesitter()
  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      'go',
      'javascript',
      'python',
      'graphql',
      'json',
      'yaml',
      'lua',
    },
    highlight = {
      enable = true,
    },
    -- incremental_selection = { enable = true },
  })
end

return M
