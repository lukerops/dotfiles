return {
  "akinsho/toggleterm.nvim",
  keys = {
    { "<C-T>", "<cmd>ToggleTerm<cr>", desc = "Open Terminal (ToggleTerm)" },
  },
  opts = {
    autochdir = true,
    direction = "float",
    hide_numbers = true,
    float_opts = {
      border = "rounded",
    },
  },
}
