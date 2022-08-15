local packer = require("utils.packer")

-- LSP
packer.add({
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  -- after = "onedark.nvim",
  after = {"cmp-nvim-lsp"},
  config = require("config.lsp").config,
})

-- packer.add({
--   "onsails/lspkind-nvim",
--   -- config = require("config.lsp.lspkind").config,
-- })

packer.add({
  "hrsh7th/nvim-cmp",
  -- after = "nvim-lspconfig",
  -- requires = {"lspkind-nvim"},
  config = require("config.lsp.cmp").config,
})

packer.add({
  "hrsh7th/cmp-nvim-lsp",
  after = {"nvim-cmp"},
})

packer.add({
  "hrsh7th/cmp-buffer",
  after = {"nvim-cmp"},
})

packer.add({
  "hrsh7th/cmp-path",
  after = {"nvim-cmp"},
})

packer.add({
  "hrsh7th/cmp-cmdline",
  after = {"nvim-cmp"},
})

packer.add({
  "saadparwaiz1/cmp_luasnip",
  requires = {"L3MON4D3/LuaSnip"},
  after = {"nvim-cmp"},
})

packer.add({
  "ray-x/lsp_signature.nvim",
  after = "nvim-lspconfig",
  config = require("config.lsp.lsp_signature").config,
})

packer.add({
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  cmd = "Trouble",
  setup = require("config.lsp.trouble").setup,
  config = require("config.lsp.trouble").config,
})

-- Telescope
packer.add({
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  after = {
    "colortheme",
    "nvim-treesitter",
  },
  requires = {
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
  },
  setup = require("config.telescope").setup,
  config = require("config.telescope").config,
})

packer.add({
  "nvim-telescope/telescope-dap.nvim",
  after = "telescope.nvim",
  requires = "nvim-dap",
  config = require("config.telescope-dap").config,
})

-- Utils
packer.add({
  "kyazdani42/nvim-tree.lua",
  cmd = {"NvimTreeToggle","NvimTreeOpen"},
  after = "colortheme",
  requires = "kyazdani42/nvim-web-devicons",
  setup = require("config.nvimtree").setup,
  config = require("config.nvimtree").config,
})

packer.add({
  "akinsho/toggleterm.nvim",
  opt = false,
  -- cmd = {"ToggleTerm"},
  config = require("config.toggleterm").config,
})

packer.add({
  "folke/todo-comments.nvim",
  cmd = { "TodoTrouble", "TodoLocList" },
  after = "trouble.nvim",
  requires = "nvim-lua/plenary.nvim",
  setup = require("config.todo").setup,
  config = require("config.todo").config,
})

packer.add({
  "terryma/vim-multiple-cursors",
  event = "BufReadPre",
})

packer.add({
  "numToStr/Comment.nvim",
  event = "BufReadPre",
  config = require("config.comment").config,
})

packer.add({
  "petertriho/nvim-scrollbar",
  after = {"colortheme"},
  config = require("config.scrollbar").config,
})

-- Tests
packer.add({
  "nvim-neotest/neotest",
  after = "nvim-dap",
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    -- language plugins
    "nvim-neotest/neotest-python",
  },
  config = require("config.neotest").config,
})
-- packer.add({
--   "rcarriga/vim-ultest",
--   cmd = {"Ultest", "UltestNearest", "UltestDebugNearest", "UltestSummary", "UltestOutput", "UltestClear", "UltestStop"},
--   after = "nvim-dap",
--   requires = {"vim-test/vim-test"},
--   run = ":UpdateRemotePlugins",
--   setup = require("config.ultest").setup,
--   config = require("config.ultest").config,
-- })

-- Debug
packer.add({
  "mfussenegger/nvim-dap",
  config = require("config.dap").config,
})

packer.add({
  "rcarriga/nvim-dap-ui",
  requires = {"mfussenegger/nvim-dap"},
  config = require("config.dap-ui").config,
})

-- Git
packer.add({
  "lewis6991/gitsigns.nvim",
  after = "colortheme",
  requires = "nvim-lua/plenary.nvim",
  config = require("config.gitsigns").config,
})

packer.add({
  "sindrets/diffview.nvim",
  config = require("config.diffview").config,
})

packer.add({
  "pwntester/octo.nvim",
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "kyazdani42/nvim-web-devicons",
  },
  config = require("config.octo").config,
})

-- Style
-- packer.add({
--   "navarasu/onedark.nvim",
--   config = require("config.onedark").config,
-- })

packer.add({
  'folke/tokyonight.nvim',
  as = "colortheme",
  config = require("config.tokyonight").config,
})

packer.add({
  "lukas-reineke/indent-blankline.nvim",
  config = require("config.indent-blankline").config,
})

packer.add({
  "folke/lsp-colors.nvim",
})

packer.add({
  "akinsho/nvim-bufferline.lua",
  after = "colortheme",
  requires = "kyazdani42/nvim-web-devicons",
  config = require("config.bufferline").config,
})

packer.add({
  "hoob3rt/lualine.nvim",
  after = "colortheme",
  requires = "kyazdani42/nvim-web-devicons",
  config = require("config.lualine").config,
})

packer.add({
  "nvim-treesitter/nvim-treesitter",
  cmd = {"TSInstall","TSInstallInfo", "TSUpdate"},
  event = "VimEnter",
  run = "TSUpdate",
  config = require("config.treesitter").config,
})

packer.add({
  "p00f/nvim-ts-rainbow",
  after = "nvim-treesitter",
})

packer.add({
  "nvim-treesitter/nvim-treesitter-textobjects",
  after = "nvim-treesitter",
})

return packer.setup()
