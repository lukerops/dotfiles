local M = {}

function M.config()
  require("lsp_signature").setup({
    bind = true, -- This is mandatory, otherwise border config won"t get registered.
    handler_opts = {
      border = "single"
    },
    toggle_key = "<M-s>"
  })
end

return M
