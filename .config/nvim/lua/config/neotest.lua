local M = {}

function M.config()
  require("neotest").setup({
    adapters = {
      require("neotest-python")({
        dap = { justMyCode = false },
        runner = 'pytest',
      }),
    },
  })

  -- keymaps
  local utils = require("utils")

  utils.nnoremap("<leader>tf", "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), env = require('utils.envs').envs})<cr>")
  utils.nnoremap("<leader>tn", "<cmd>lua require('neotest').run.run()<cr>")
  utils.nnoremap("<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<cr>")
  utils.nnoremap("<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>")
  utils.nnoremap("<leader>tdbg", "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>")
end

return M
