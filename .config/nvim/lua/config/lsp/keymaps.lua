local M = {}

function M.setup(client, bufnr)
  local utils = require("utils")
  
  opts = { buffer = bufnr }

  utils.nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>",     opts)
  utils.nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>",    opts)
  utils.nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  utils.nnoremap("gr", "<cmd>lua vim.lsp.buf.references()<CR>",     opts)

  utils.nnoremap("<leader>ft", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  utils.nnoremap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>",     opts)
end

return M
