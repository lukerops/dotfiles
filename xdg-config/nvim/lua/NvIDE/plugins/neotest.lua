return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-python",
    "mfussenegger/nvim-dap",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    {
      "<leader>tf",
      function()
        require("neotest").run.run({ vim.fn.expand("%"), env = require("dotenv").get_envs() })
      end,
      desc = "Run All Tests in the file",
    },
    {
      "<leader>tn",
      function()
        require("neotest").run.run({ env = require("dotenv").get_envs() })
      end,
      desc = "Run the nearest test",
    },
    {
      "<leader>to",
      function()
        require("neotest").output.open({ enter = true })
      end,
      desc = "Open the result of the nearest test",
    },
    {
      "<leader>ts",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Open the Test Summary",
    },
    {
      "<leader>tdbg",
      function()
        require("neotest").run.run({ strategy = "dap", env = require("dotenv").get_envs() })
      end,
      desc = "Run the nearest test in debug",
    },
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          runner = "pytest",
          python = require("python").get_python_path(vim.loop.cwd()),
        }),
      }
    })
  end,
}
