local M = {}

local function uses_pyenv(workspace)
  local paths = vim.fs.find('.python-version', {
    upward = false,
    type = 'file',
    path = workspace,
  })

  return vim.tbl_count(paths) > 0
end

local function get_pyenv_python_path(version)
  local versions = {}
  local nums = vim.split(version, '.', { plain = true })

  for i = 1, vim.tbl_count(nums) do
    local _version = {}
    for j = 1, i do
      table.insert(_version, nums[j])
    end

    table.insert(versions, vim.fn.join(_version, '.'))
  end

  local paths = vim.fs.find(versions, {
    upward = true,
    limit = math.huge,
    type = 'directory',
    path = vim.fs.normalize('~/.pyenv/versions/'),
    stop = vim.fs.normalize('~/.pyenv/'),
  })

  if vim.tbl_count(paths) == 0 then
    vim.notify('Python ' .. version .. ' not installed by pyenv.', vim.log.levels.ERROR)
    return
  end

  table.sort(paths)
  return vim.fs.normalize(paths[1] .. '/bin/python3')
end

function M.get_python_path(workspace)
  local python = 'python3'

  if uses_pyenv(workspace) then
    local pyenv_python = get_pyenv_python_path(vim.fn.readfile(workspace .. '/.python-version')[1])
    if pyenv_python then
      python = pyenv_python
    end
  end

  -- uses poetry's venv python
  local paths = vim.fs.find('poetry.lock', {
    upward = false,
    type = 'file',
    path = workspace,
  })
  if vim.tbl_count(paths) > 0 then
    local venv = vim.fn.trim(vim.fn.system({ python, '-m', 'poetry', '--directory', workspace, 'env', 'info', '-p' }))
    return vim.fs.normalize(venv .. '/bin/python3')
  end

  -- uses the venv python
  paths = vim.fs.find({ 'venv', '.venv' }, {
    upward = false,
    type = 'directory',
    path = workspace,
  })
  if vim.tbl_count(paths) > 0 then
    return vim.fs.normalize(paths[1] .. '/bin/python3')
  end

  return python
end

function M.lsp_on_init(client)
  local python_path = M.get_python_path(client.config.root_dir)
  local settings = {
    plugins = {
      jedi = {
        environment = python_path,
      },
    },
  }

  client.config.settings.pylsp = vim.tbl_deep_extend('force', client.config.settings.pylsp, settings)

  -- WARNING: gambiarra para notificar a mudança para o LSP.
  -- NOTE: por algum motivo o neovim não está notificando a
  -- configuração modificada.
  client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
end

return M
