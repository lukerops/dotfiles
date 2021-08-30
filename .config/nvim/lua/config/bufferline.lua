local M = {}

function M.config()
  local config = {
    enforce_regular_tabs = true,
    --view = "multiwindow",
    offsets = {
      {filetype = "NvimTree", text = "File Explorer", text_align = "center"},
      {filetype = "packer", text = "Packer", text_align = "center"},
      {filetype = "Outline", text = "File Symbols", text_align = "center"},
      {filetype = "UltestSummary", text = "Tests Summary", text_align = "center"},
      {filetype = "DiffviewFiles", text = "Git Diff", text_align = "center"},
      {filetype = "dapui_watches", text = "Debug", text_align = "center"},
    },
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " "
          or (e == "warning" and " " or "" )
        s = s .. n .. sym
      end
      return s
    end
  }
  
  require("bufferline").setup({
    options = config,
  })
end

return M