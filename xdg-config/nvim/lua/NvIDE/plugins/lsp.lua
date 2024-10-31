return {
  {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    dependencies = {
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-buffer",
      {
        "saadparwaiz1/cmp_luasnip",
        dependencies = { {
          "L3MON4D3/LuaSnip",
          dependencies = { "rafamadriz/friendly-snippets" },
        } },
      },
      {
        "zbirenbaum/copilot-cmp",
        dependencies = { {
          "zbirenbaum/copilot.lua",
          cmd = "Copilot",
          -- event = "InsertEnter",
          opts = {
            suggestion = { enabled = false },
            panel = { enabled = false },
          }
        } },
        config = true,
      },
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "copilot" },
        }, {
          { name = "buffer", keyword_length = 3 },
          { name = "path" },
        }),
        mapping = cmp.mapping.preset.insert({
          -- `Enter` key to confirm completion
          ["<CR>"] = cmp.mapping.confirm({ select = false }),

          -- Ctrl+Space to trigger completion menu
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),

          -- Navigate between snippet placeholder
          -- ["<C-f>"] = cmp_action.luasnip_jump_forward(),
          -- ["<C-b>"] = cmp_action.luasnip_jump_backward(),

          -- scroll up and down the documentation window
          ['<C-Up>'] = cmp.mapping.scroll_docs(-4),
          ['<C-Down>'] = cmp.mapping.scroll_docs(4),
        }),
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        sorting = {
          priority_weight = 2,
          comparators = {
            require("copilot_cmp.comparators").prioritize,
            -- Below is the default comparitor list and order for nvim-cmp
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            -- cmp.config.compare.scopes,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            -- cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "cmdline" }
        }
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" }
        }
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    opts = {
      ui = {
        border = "rounded"
      }
    },
  },
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart", },
    event = { "BufReadPre", "BufNewFile", },
    dependencies = {
      {
        "hrsh7th/cmp-nvim-lsp",
        dependencies = { "hrsh7th/nvim-cmp", },
      },
      {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
          ensure_installed = { "lua_ls", "pylsp", "gopls", "terraformls" },
          handlers = {
            -- default handler
            function(server_name)
              require("lspconfig")[server_name].setup({})
            end,

            -- desativa a configuraço automática do tsserver
            -- para utilizar o typescript-tools
            ts_ls = function() end,
          }
        }
      },
    },
    config = function()
      local lspconfig = require('lspconfig')

      -- Add cmp_nvim_lsp capabilities settings to lspconfig
      lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
        'force',
        lspconfig.util.default_config.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
      )

      -- cria um on_attach default
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local id = vim.tbl_get(event, 'data', 'client_id')
          local client = vim.lsp.get_client_by_id(id) or {}

          local bufnr = event.buf
          local opts = { buffer = bufnr }

          -- ativa o inlay hint
          if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, opts)
          end

          vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
          vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
          vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
          vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
          vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
          vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
          -- vim.keymap.set('n', 'gr', '<cmd>Trouble lsp_references<cr>', opts)
          vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
          vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
          vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
          vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        end,
      })

      vim.diagnostic.config({
        -- update_in_insert = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '●',
            [vim.diagnostic.severity.WARN] = '●',
            [vim.diagnostic.severity.HINT] = '●',
            [vim.diagnostic.severity.INFO] = '●'
          }
        }
      })
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    opts = {
      settings = {
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
        tsserver_format_options = {
          tabSize = 2,
          indentSize = 2,
        },
      },
    },
  }
}
