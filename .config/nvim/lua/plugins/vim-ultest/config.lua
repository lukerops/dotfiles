local env_files = require('core.global_vars').env_files

local env_vars = {}
for index, env_file in ipairs(env_files) do
  if vim.fn.empty(vim.fn.glob(env_file)) == 0 then
    for li, line in ipairs(vim.fn.readfile(env_file)) do
      for k, v in string.gmatch(line, '(.+)=[\'"]?(.*)[\'"]?') do
        -- print('key: '.. k .. '\nvalue: '.. v .. '\n')
	env_vars[k] = v
      end
    end
  end
end

vim.g.ultest_env = env_vars

vim.cmd([[
  " echo g:ultest_env
  let test#python#runner = 'pytest'
  " let test#python#pytest#file_pattern = ''
]])
