return {
  "neovim/nvim-lspconfig",
  cmd = { "LspInfo", "LspInstall", "LspStart", },
  event = { "BufReadPre", "BufNewFile", },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason-lspconfig.nvim",
    "ray-x/lsp_signature.nvim",
    "folke/neodev.nvim",
  },
  config = function()
    -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
    require("neodev").setup({})

    -- This is where all the LSP shenanigans will live
    local lsp_zero = require("lsp-zero")
    lsp_zero.extend_lspconfig()

    lsp_zero.set_sign_icons({
      error = '●',
      warn = '●',
      hint = '●',
      info = '●'
    })

    lsp_zero.on_attach(function(_, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp_zero.default_keymaps({ buffer = bufnr })
    end)

    -- configura alguns LSPs com a configuração padrão
    -- lsp_zero.setup_servers({ "pylsp" })
    lsp_zero.configure("pylsp", {
      settings = {
        pylsp = {
          plugins = {
            flake8 = {
              maxLineLength = 120,
            },
            pycodestyle = {
              maxLineLength = 120,
            }
          }
        }
      }
    })

    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", },
      handlers = {
        lsp_zero.default_setup,
      }
    })
  end
}
