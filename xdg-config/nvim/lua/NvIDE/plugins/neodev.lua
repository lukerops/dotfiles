return {
  "folke/neodev.nvim",
  lazy = true,
  opts = {
    library = {
      plugins = { "nvim-dap-ui", "neotest" },
      types = true,
    },
  }
}
