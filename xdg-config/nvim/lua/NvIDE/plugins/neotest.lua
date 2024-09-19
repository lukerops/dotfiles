return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "mfussenegger/nvim-dap",

    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-jest",
  },
  keys = {
    {
      "<leader>tf",
      function() require("neotest").run.run({ vim.fn.expand("%") }) end,
      desc = "Run All Tests in the file",
    },
    {
      "<leader>tn",
      function() require("neotest").run.run() end,
      desc = "Run the nearest test",
    },
    {
      "<leader>to",
      function() require("neotest").output.open({ enter = true }) end,
      desc = "Open the result of the nearest test",
    },
    {
      "<leader>ts",
      function() require("neotest").summary.toggle() end,
      desc = "Open the Test Summary",
    },
    {
      "<leader>tdbg",
      function() require("neotest").run.run({ strategy = "dap" }) end,
      desc = "Run the nearest test in debug",
    },
  },
  opts = function()
    return {
      run = {
        augment = function(_, args)
          -- Add the environment variables from the .env file
          args.env = vim.tbl_deep_extend("force", args.env or {}, require("dotenv").get_envs())

          return args
        end,
      },
      adapters = {
        require("neotest-python")({
          args = { "-vv" },
          runner = "pytest",
          python = require("python").get_python_path(vim.loop.cwd()),
        }),
        require('neotest-jest')({
          jestCommand = "npm test --",
          -- jestConfigFile = "custom.jest.config.ts",
          -- env = { CI = true },
          -- cwd = function(path)
          --   return vim.fn.getcwd()
          -- end,
        }),
      }
    }
  end,
}
