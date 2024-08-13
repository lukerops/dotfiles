return {
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    init = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },
  -- {
  --   "navarasu/onedark.nvim",
  --   opts = {
  --     style = "deep",
  --   },
  --   init = function()
  --     require("onedark").load()
  --   end,
  -- },
  -- {
  --   "projekt0n/github-nvim-theme",
  --   -- init = function()
  --   --   vim.cmd.colorscheme("github_dark")
  --   -- end,
  -- },
  -- {
  --   "Mofiqul/vscode.nvim",
  --   init = function()
  --     require("vscode").load("dark")
  --   end,
  -- },
  -- {
  --   "Mofiqul/dracula.nvim",
  --   init = function()
  --     vim.cmd.colorscheme("dracula")
  --   end,
  -- },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   -- init = function()
  --   --   vim.cmd.colorscheme("catppuccin")
  --   -- end,
  -- },
}
