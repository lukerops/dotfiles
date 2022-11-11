local M = {}

function M.config()
  local actions = require("telescope.actions")

  require("telescope").setup({
    defaults = {
      mappings = {
        i = {
          ["<C-Up>"] = actions.preview_scrolling_up,
          ["<C-Down>"] = actions.preview_scrolling_down,
        },
        n = {
          ["<C-Up>"] = actions.preview_scrolling_up,
          ["<C-Down>"] = actions.preview_scrolling_down,
        },
      },
    },
  })
end

function M.setup()
  local utils = require("utils")
  
  utils.nnoremap("<C-p>", "<cmd>Telescope find_files<CR>")
  utils.nnoremap("<M-C-F>", "<cmd>Telescope live_grep<CR>")
  utils.nnoremap("<leader>gts", "<cmd>Telescope git_status<CR>")
end

return M
