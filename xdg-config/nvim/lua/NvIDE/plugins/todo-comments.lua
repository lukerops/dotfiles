return {
  "folke/todo-comments.nvim",
  cmd = { "TodoTrouble", "TodoTelescope" },
  event = "BufReadPost",
  config = true,
  dependencies = {
    "folke/trouble.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    { "]t",          function() require("todo-comments").jump_next() end,          desc = "Next todo comment" },
    { "[t",          function() require("todo-comments").jump_prev() end,          desc = "Previous todo comment" },
    { "<leader>xt",  "<cmd>Trouble todo toggle<cr>",                               desc = "Todo Trouble" },
    { "<leader>xtt", "<cmd>Trouble todo toggle filter={tag={TODO,FIX,FIXME}}<cr>", desc = "Todo Trouble" },
    { "<leader>xT",  "<cmd>TodoTelescope<cr>",                                     desc = "Todo Telescope" },
  },
}
