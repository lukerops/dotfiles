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

  local utils = require("utils")

  utils.nnoremap("<leader>1",   "<cmd>BufferLineGoToBuffer 1<cr>")
  utils.nnoremap("<leader>2",   "<cmd>BufferLineGoToBuffer 2<cr>")
  utils.nnoremap("<leader>3",   "<cmd>BufferLineGoToBuffer 3<cr>")
  utils.nnoremap("<leader>4",   "<cmd>BufferLineGoToBuffer 4<cr>")
  utils.nnoremap("<leader>5",   "<cmd>BufferLineGoToBuffer 5<cr>")
  utils.nnoremap("<leader>6",   "<cmd>BufferLineGoToBuffer 6<cr>")
  utils.nnoremap("<leader>7",   "<cmd>BufferLineGoToBuffer 7<cr>")
  utils.nnoremap("<leader>8",   "<cmd>BufferLineGoToBuffer 8<cr>")
  utils.nnoremap("<leader>9",   "<cmd>BufferLineGoToBuffer 9<cr>")
end

return M
