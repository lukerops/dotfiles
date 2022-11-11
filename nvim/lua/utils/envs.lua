local M = {}

function M.setup(opts)
  local default = {
    env_files = { ".env", ".env.local" }
  }

  opts = vim.tbl_deep_extend("force", default, opts or {})
  M.env_files = opts.env_files

  M.load()
end

function M.load()
  M.envs = {}

  for index, file in ipairs(M.env_files) do
    if vim.fn.empty(vim.fn.glob(file)) ~= 0 then
      break
    end

    for lindex, line in ipairs(vim.fn.readfile(file)) do
      for name, value in string.gmatch(line, "(.+)=['\"]?(.*)['\"]?") do
        str_end = string.sub(value, -1, -1)
        if str_end == "'" or str_end == '"' then
          value = string.sub(value, 1, -2)
        end

        print("key: ".. name .. "\nvalue: ".. value .. "\n")
        M.envs[name] = value
      end
    end
  end
end

return M
