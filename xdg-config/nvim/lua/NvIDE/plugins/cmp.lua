return {
  "hrsh7th/nvim-cmp",
  -- lazy = true,
  event = "VeryLazy",
  -- event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    -- "hrsh7th/cmp-buffer",
    {
      "saadparwaiz1/cmp_luasnip",
      dependencies = {
        {
          "L3MON4D3/LuaSnip",
          dependencies = { "rafamadriz/friendly-snippets" },
        },
      },
    },
  },
  config = function()
    -- Here is where you configure the autocompletion settings.
    local lsp_zero = require("lsp-zero")
    lsp_zero.extend_cmp()

    -- Load all snipts from friendly-snippets
    require('luasnip.loaders.from_vscode').lazy_load()

    -- And you can configure cmp even more, if you want to.
    local cmp = require("cmp")
    local cmp_action = lsp_zero.cmp_action()

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
        -- { name = "neorg" },
      },
      mapping = {
        -- `Enter` key to confirm completion
        ["<CR>"] = cmp.mapping.confirm({ select = false }),

        -- Ctrl+Space to trigger completion menu
        ["<C-Space>"] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ["<C-f>"] = cmp_action.luasnip_jump_forward(),
        ["<C-b>"] = cmp_action.luasnip_jump_backward(),

        -- scroll up and down the documentation window
        ['<C-Up>'] = cmp.mapping.scroll_docs(-4),
        ['<C-Down>'] = cmp.mapping.scroll_docs(4),
      },
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
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
      sources = { { name = "cmdline" } }
    })

    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = { { name = "buffer" } }
    })
  end,
}
