return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      icons_enabled = true,
      -- component_separators = {"", ""},
      -- section_separators = {"", ""},
      -- disabled_filetypes = {},
      component_separators = '',
      section_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = {
          "mason",
          "lazy",
        },
      },
    },
    sections = {
      lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
      lualine_b = { "branch", },
      lualine_c = { 'diff', "diagnostics", '%=', { 'filename', path = 1 }, },
      lualine_x = { "filetype" },
      lualine_y = { "progress" },
      lualine_z = { { 'location', separator = { right = '' }, left_padding = 2 }, }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { { 'filename', path = 1 } },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {}
    },
    extensions = {
      {
        sections = {
          lualine_a = { {
            function()
              return vim.fn.fnamemodify(require("oil").get_current_dir(), ':~') or ""
            end,
            separator = { left = '', right = '' },
            right_padding = 2,
          } }
        },
        filetypes = { "oil" }
      },
      {
        sections = {
          lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
          lualine_b = { "branch", },
        },
        filetypes = { "toggleterm" },
      },
    },
  }
}
