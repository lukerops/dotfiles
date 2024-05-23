return {
  "neovim/nvim-lspconfig",
  cmd = { "LspInfo", "LspInstall", "LspStart", },
  event = { "BufReadPre", "BufNewFile", },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "ray-x/lsp_signature.nvim",
    "folke/neodev.nvim",
    {
      "williamboman/mason-lspconfig.nvim",
      dependencies = { "williamboman/mason.nvim" },
    },
  },
  config = function()
    -- vim.lsp.set_log_level(vim.log.levels.DEBUG)

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

      vim.keymap.set('n', 'gr', '<cmd>Trouble lsp_references<cr>', { buffer = bufnr })
    end)

    -- configura alguns LSPs com a configuração padrão
    -- lsp_zero.setup_servers({ "pylsp" })
    lsp_zero.configure("pylsp", {
      on_init = require('python').lsp_on_init,
      settings = { pylsp = { plugins = {
        flake8 = { maxLineLength = 120 },
        pycodestyle = { maxLineLength = 120 },
        rope_autoimport = { enabled = true },
        rope_completion = { enabled = true },
      } } }
    })

    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "pylsp", "ruff_lsp", "gopls", "terraformls" },
      handlers = {
        lsp_zero.default_setup,
      }
    })
  end
}
