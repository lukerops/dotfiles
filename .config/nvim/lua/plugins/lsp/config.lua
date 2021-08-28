local M = {}

function M.lspconfig()
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
    gopls = require('plugins.lsp.languages.golang'),
    pylsp = require('plugins.lsp.languages.python'),
  }

  local lspconfig = require('lspconfig')
  for server, config in pairs(servers) do
    lspconfig[server].setup(vim.tbl_deep_extend("force", default_config, config))
  end
end

function M.compe()
  vim.o.completeopt = 'menuone,noselect'

  require('compe').setup({
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,

    source = {
      path = true,
      buffer = false,
      calc = false,
      nvim_lsp = true,
      nvim_lua = true,
      vsnip = false,
      ultisnips = false,
      snippets_nvim = true,
    },
  })
end

function M.lspsignature()
  require('lsp_signature').setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = 'single'
    },
    toggle_key = '<M-s>'
  })
end

return M