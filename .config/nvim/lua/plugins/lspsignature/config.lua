local signature = require('lsp_signature')

signature.setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = 'single'
  },
  toggle_key = '<M-s>'
})
