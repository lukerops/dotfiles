local bufferline = require('bufferline')

local config = {
  mappings = true,
  enforce_regular_tabs = true,
  --view = 'multiwindow',
  offsets = {
    {filetype = 'NvimTree', text = 'File Explorer', text_align = 'center'},
    {filetype = 'packer', text = 'Packer', text_align = 'center'},
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

bufferline.setup {
  options = config,
}

