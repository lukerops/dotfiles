local Plugins = {
  config = {
    packer_install_path = string.format('%s/site/pack/packer/opt/', vim.fn.stdpath('data')),
    packer_config = {} 
  },
  plugins = {}
}
Plugins.__index = Plugins

function Plugins:installPacker()
  if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
    return false
  end

  -- ensure the path exists
  vim.fn.mkdir(self.config.packer_install_path, 'p')
  
  -- clone the repo if not exists
  if vim.fn.empty(vim.fn.glob(self.config.packer_install_path)) == 0 then
    vim.fn.system({
      'git', 'clone',
      'https://github.com/wbthomason/packer.nvim',
      string.format('%s/packer.nvim', self.config.packer_install_path)
    })
  end

  return true
end

function Plugins:importPacker()
  -- check if nvim can import packer
  if vim.fn.isdirectory(self.config.packer_install_path) == 0 then
    if not self:installPacker() then
      return false
    end
  end

  vim.api.nvim_command('packadd packer.nvim')
  self.packer = require('packer')
  return true
end

function Plugins:new()
  if not self:importPacker() then
    return
  end

  self.packer.reset()
  return self
end

function Plugins:add(plugin)
  table.insert(self.plugins, plugin)
end

function Plugins:load()
  require('plugins.lsp')
  require('plugins.style')
  require('plugins.telescope')
  require('plugins.tests')
  require('plugins.utils')
  require('plugins.git')
end

function Plugins:startup()
  local plugins = self.plugins

  return function(use)
    use { 'wbthomason/packer.nvim', opt = true }

    for index, plugin in ipairs(plugins) do
      use(plugin)
    end
  end

end

function Plugins:start(use)
  self:load()

  return self.packer.startup({
    self:startup(),
    config = self.config.packer_config
  })
end

return Plugins:new()
