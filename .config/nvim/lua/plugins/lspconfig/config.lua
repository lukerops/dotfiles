local lspconfig = require('lspconfig')

vim.fn.sign_define("LspDiagnosticsSignError", {text = ""})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = ""})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = ""})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = ""})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- local function on_attach(client, bufnr)
--   if client.resolved_capabilities.document_formatting then
--     format.lsp_before_save()
--   end
-- end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = true,
    -- Enable virtual text, override spacing to 4
    virtual_text = true,
    signs = true,
    -- Disable a feature
    update_in_insert = false,
})

local default_config = {
  -- on_attach = on_attach,
  capabilities = capabilities,
}

local servers = {
  gopls = require('plugins.lspconfig.languages.golang'),
  pylsp = require('plugins.lspconfig.languages.python'),
}

for server, config in pairs(servers) do
  lspconfig[server].setup(vim.tbl_deep_extend("force", default_config, config))
end


