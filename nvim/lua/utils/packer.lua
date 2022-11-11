local M = {
  packer = {
    install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim",
    config = {},
  },
  plugins = {},
}

function M.bootstrap()
  local fn = vim.fn
  local install_path = M.packer.install_path
  
  -- ensure the path exists
  fn.mkdir(install_path, "p")

  -- clone the repo if not exists
  if fn.empty(fn.glob(install_path .. "/*")) > 0 then
    fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
  end

  vim.cmd("packadd packer.nvim")
end

function M.add(plugin)
  table.insert(M.plugins, plugin)
end

function M.startup()
  return function(use)
    use { "wbthomason/packer.nvim" }
    
    for index, plugin in ipairs(M.plugins) do
      use(plugin)
    end
  end
end

function M.setup(config)
  vim.tbl_deep_extend("force", M.packer, config or {})
  M.bootstrap()

  local packer = require("packer")
  return packer.startup({
    M.startup(),
    config = M.packer.config
  })
end

return M
