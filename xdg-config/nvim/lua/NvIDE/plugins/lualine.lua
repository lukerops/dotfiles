return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    -- {
    --   "AndreM222/copilot-lualine",
    --   dependencies = { "zbirenbaum/copilot.lua" },
    -- },
  },
  -- enabled = false,
  event = "VeryLazy",
  opts = {
    options = {
      icons_enabled = true,
      -- component_separators = {"", ""},
      -- section_separators = {"", ""},
      -- disabled_filetypes = {},
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", 'diff' },
      lualine_c = { "filename", "diagnostics" },
      lualine_x = { --[[ { "copilot", show_colors = true, }, ]] "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {}
    },
    extensions = {
      "lazy",
      "neo-tree",
      "nvim-dap-ui",
      "trouble",
    },
  },
}
