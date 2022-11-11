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
    rainbow = {
      enable = true,
      -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
      -- colors = {}, -- table of hex strings
      -- termcolors = {} -- table of colour name strings
    }
  })
end

return M
