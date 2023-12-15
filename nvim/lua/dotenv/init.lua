local M = {}

local function get_envfile()
  return ".env/env.list"
end

function M.get_envs()
  local envfile = get_envfile()
  local envs = {}

  if vim.fn.empty(vim.fn.glob(envfile)) ~= 0 then
    return envs
  end

  for _, line in ipairs(vim.fn.readfile(envfile)) do
    for name, value in string.gmatch(line, "(.+)=['\"]?(.*)['\"]?") do
      -- verifica se a linha precisa ser ignorada
      if string.sub(name, 0, 1) == "#" then
        goto continue
      end

      -- verifica se o valor precisa ser retirado as aspas
      local str_end = string.sub(value, -1, -1)
      if str_end == "'" or str_end == '"' then
        value = string.sub(value, 1, -2)
      end

      envs[name] = value

      ::continue::
    end
  end

  return envs
end

return M
