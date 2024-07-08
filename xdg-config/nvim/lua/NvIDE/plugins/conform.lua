return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      python = { 'ruff_format', 'ruff_organize_imports' },
      terraform = { 'terraform_fmt' },
    },
    format_on_save = {
      -- I recommend these options. See :help conform.format for details.
      lsp_fallback = true,
      timeout_ms = 500,
    }
  },
}
