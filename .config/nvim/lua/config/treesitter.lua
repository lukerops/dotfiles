local M = {}

function M.config()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "go",
      "javascript",
      "typescript",
      "python",
      "graphql",
      "json",
      "yaml",
      "lua",
      "bash",
      "dockerfile",
      "query",
      "regex",
      "toml",
    },
    highlight = {
      enable = true,
    },
    -- incremental_selection = { enable = true },
  })
end

return M