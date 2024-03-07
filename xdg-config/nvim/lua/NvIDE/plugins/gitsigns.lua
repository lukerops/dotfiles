return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  opts = {
    current_line_blame = true,
    signs = {
      add          = { text = '│' },
      change       = { text = '│' },
      delete       = { text = '│' },
      topdelete    = { text = '│' },
      changedelete = { text = '│' },
      untracked    = { text = '│' },
    },
  },
}
