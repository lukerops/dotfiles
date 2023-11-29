return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v2.x",
  dependencies = {
    -- LSP Support
    "neovim/nvim-lspconfig",
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
      opts = {
        ui = {
          border = "rounded"
        }
      }
    },
    "williamboman/mason-lspconfig.nvim",
    "ray-x/lsp_signature.nvim",

    -- Autocompletion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
  },
  config = function(plugin, opts)
    local lsp = require("lsp-zero").preset({
      float_border = "rounded",
      manage_nvim_cmp = {
        documentation_window = true,
      },
    })

    lsp.on_attach(function(client, bufnr)
      lsp.default_keymaps({ buffer = bufnr })
    end)

    local lspconfig = require("lspconfig")
    lspconfig.pylsp.setup({})

    lsp.setup()

    -- You need to setup `cmp` after lsp-zero
    local cmp = require("cmp")
    local cmp_action = require("lsp-zero").cmp_action()

    cmp.setup({
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        -- { name = "buffer", keyword_length = 3 },
        { name = "luasnip", keyword_length = 2 },
      },
      mapping = {
        -- `Enter` key to confirm completion
        ["<CR>"] = cmp.mapping.confirm({ select = false }),

        -- Ctrl+Space to trigger completion menu
        ["<C-Space>"] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ["<C-f>"] = cmp_action.luasnip_jump_forward(),
        ["<C-b>"] = cmp_action.luasnip_jump_backward(),
      },
      -- formatting = {
      --   fields = { "kind", "abbr", "menu" },
      --   format = function(_, item)
      --     local icons = require("nvide.core.ui.icons").kinds
      --     item.menu = item.kind
      --     item.kind = icons[item.kind]
      --     return item
      --   end,
      -- },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {{ name = "cmdline" }}
    })

    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {{ name = "buffer" }}
    })
  end,
}
