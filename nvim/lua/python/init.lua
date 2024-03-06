local M = {}

local function uses_pyenv(workspace)
  local match = vim.fn.glob(vim.fs.normalize(workspace .. '/.python-version'))
  return match ~= ''
end

local function get_pyenv_python_path(version)
  local match = vim.fn.glob('~/.pyenv/versions/' .. version .. '*')
  if match == '' then
    vim.notify('Python ' .. version .. ' not installed by pyenv.', vim.log.levels.ERROR)
    return
  end

  local versions = vim.split(match, '\n')
  table.sort(versions)

  return vim.fs.normalize(versions[1] .. '/bin/python3')
end

local function get_python_path(workspace)
  local python = 'python3'
  if uses_pyenv(workspace) then
    python = get_pyenv_python_path(vim.fn.readfile(workspace .. '/.python-version')[1])
  end

  -- check if the project uses poetry
  local match = vim.fn.glob(vim.fs.normalize(workspace .. '/poetry.lock'))
  if match ~= '' then
    local venv = vim.fn.trim(vim.fn.system({ python, '-m', 'poetry', '--directory', workspace, 'env', 'info', '-p' }))
    return vim.fs.normalize(venv .. '/bin/python3')
  end

  return python
end

function M.on_init(client)
  local python_path = get_python_path(client.config.root_dir)
  local settings = {
    -- python = {
    --   pythonPath = python_path,
    -- },
    pylsp = {
      plugins = {
        jedi = {
          environment = python_path
        },
      },
    },
  }

  client.config.settings = vim.tbl_deep_extend('force', client.config.settings, settings)
end

return M
