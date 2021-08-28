local set_keymap = vim.api.nvim_set_keymap
local M = {}

function M.diffview()
  local diffviewOpened = false

  function toggleDiffview()
    local diffview = require('diffview')
    if not diffviewOpened then
      diffview.open()
    else
      diffview.close()
    end
    diffviewOpened = not diffviewOpened
  end

  set_keymap('n', '<leader>gtd', '<cmd>lua toggleDiffview()<CR>', {noremap = true, silent = true})
end

return M