local M = {}

function M.config()
  require("lualine").setup({
    options = {
      icons_enabled = true,
      -- theme = "onedark",
      theme = "tokyonight",
      component_separators = {"", ""},
      section_separators = {"", ""},
      disabled_filetypes = {
        "NvimTree",
        "packer",
        "UltestSummary",
        "DiffviewFiles",
        "Trouble",
        "dapui_watches",
        "dapui_stacks",
        "dapui_breakpoints",
        "dapui_scopes",
        "dap-repl",
      },
    },
    sections = {
      lualine_a = {"mode"},
      lualine_b = {"branch"},
      lualine_c = {"filename"},
      lualine_x = {"encoding", "fileformat", "filetype"},
      lualine_y = {"progress"},
      lualine_z = {"location"}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {"filename"},
      lualine_x = {"location"},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {}
  })
end

return M