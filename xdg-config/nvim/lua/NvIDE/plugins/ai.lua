return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      "zbirenbaum/copilot.lua", -- or github/copilot.vim
      "nvim-lua/plenary.nvim",  -- for curl, log wrapper
    },
    cmd = {
      "CopilotChatToggle", "CopilotChatCommit", "CopilotChatCommitStaged",
      "CopilotChatExplain", "CopilotChatReview",
    },
    opts = {
      -- debug = true, -- Enable debugging
      -- See Configuration section for rest
      window = {
        layout = "float",
        border = "rounded",
      }
    }
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp",                      -- Optional: For using slash commands and variables in the chat buffer
      "nvim-telescope/telescope.nvim",         -- Optional: For using slash commands
      { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
    },
    cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
    opts = {
      display = {
        action_palette = {
          provider = "telescope"
        },
        chat = {
          window = {
            layout = "float",
            border = "rounded",
          }
        }
      }
    }
  }
}
