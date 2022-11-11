local M = {}

function M.config()
  require("diffview").setup({})

  -- keymaps
  local utils = require("utils")

  local diffviewOpened = false

  function toggle_diffview()
    local diffview = require("diffview")
    if not diffviewOpened then
      diffview.open()
    else
      diffview.close()
    end
    diffviewOpened = not diffviewOpened
  end

  utils.nnoremap("<leader>gtd", "<cmd>lua toggle_diffview()<CR>")
end

return M