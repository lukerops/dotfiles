local M = {}

function M.setup()
  local env_files = { ".env", ".env.local" }

  local env_vars = {}
  for index, env_file in ipairs(env_files) do
    if vim.fn.empty(vim.fn.glob(env_file)) == 0 then
      for li, line in ipairs(vim.fn.readfile(env_file)) do
        for k, v in string.gmatch(line, "(.+)=['\"]?(.*)['\"]?") do
          -- print("key: ".. k .. "\nvalue: ".. v .. "\n")
          env_vars[k] = v
        end
      end
    end
  end

  vim.g.ultest_env = env_vars

  vim.cmd([[
    " echo g:ultest_env
    let test#python#runner = 'pytest'
    let test#python#pytest#options = "--color=yes"
    " let test#python#pytest#file_pattern = ''
  ]])

  -- keymaps
  local utils = require("utils")

  utils.nnoremap("<leader>tf", "<cmd>Ultest<cr>")
  utils.nnoremap("<leader>tn", "<cmd>UltestNearest<cr>")
  utils.nnoremap("<leader>to", "<cmd>UltestOutput<cr>")
  utils.nnoremap("<leader>ts", "<cmd>UltestSummary<cr>")
  utils.nnoremap("<leader>tdbg", "<cmd>UltestDebugNearest<cr>")
end

function M.config()
  local builders = {
	python = function(cmd)
      local non_modules = { "python", "pipenv", "poetry" }

      local module_index
      if vim.tbl_contains(non_modules, cmd[1]) then
        module_index = 3
      else
        module_index = 1
      end

      local args = vim.list_slice(cmd, module_index + 1)

      return {
        dap = {
          type = "python",
          name = "Ultest Debugger",
          request = "launch",
          module = cmd[module_index],
          args = args,
          justMyCode = false,
        },
      }
    end,
  }

  require("ultest").setup({ builders = builders })
end

return M
