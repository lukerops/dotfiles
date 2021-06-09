

local Plugins = {
  config = {
    packer_install_path = string.format('%s/site/pack/packer/opt/', vim.fn.stdpath('data')),
    packer_config = {} 
  }
}
Plugins.__index = Plugins

function Plugins:init()
  if not self:import_packer() then
    return
  end

  self.packer.reset()

  return self.packer.startup({
    Plugins.start,
    config = self.config.packer_config
  })
end

function Plugins:import_packer()
  -- check if nvim can import packer
  if vim.fn.isdirectory(self.config.packer_install_path) == 0 then
    if not self:install_packer() then
      return false
    end
  end

  vim.api.nvim_command('packadd packer.nvim')
  self.packer = require('packer')
  return true
end

function Plugins:install_packer()
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

function Plugins.start(use)
  use { 'wbthomason/packer.nvim', opt = true }

  -- import all plugins bellow

  plugins = {
    require('plugins.nvim-lspconfig'),
    require('plugins.nvim-tree'),
    require('plugins.nvim-treesitter'),
    require('plugins.nvim-compe'),
    require('plugins.nvim-bufferline'),
    -- require('plugins.tokyonight'),
    require('plugins.onedark'),
    require('plugins.lualine'),
    require('plugins.indent-blankline'),
    require('plugins.telescope'),
    require('plugins.gitsigns'),
  }

  for index, plugin in ipairs(plugins) do
    use(plugin)
  end
end

return Plugins:init()
