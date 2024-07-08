return {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle", "Trouble" },
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
  },
  opts = {
    use_diagnostic_signs = true,
  },
}
