return {
  "9seconds/repolink.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "RepoLink",
  keys = {
    { "<leader>gl", "<cmd>RepoLink<cr>", desc = "Generate Git HTTP permalink" },
  },
  config = true,
}
