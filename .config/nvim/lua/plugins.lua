local packer = require("utils.packer")

-- LSP
packer.add({
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  -- after = "onedark.nvim",
  config = require("config.lsp").config,
})

packer.add({
  "hrsh7th/nvim-compe",
  event = "InsertEnter",
  after = "nvim-lspconfig",
  requires = "norcalli/snippets.nvim",
  config = require("config.lsp.compe").config,
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

packer.add({
  "onsails/lspkind-nvim",
  disable = true,
  after = "nvim-compe",
  config = require("config.lsp.lspkind").config,
})

-- Telescope
packer.add({
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  after = "colortheme",
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

-- Tests
packer.add({
  "rcarriga/vim-ultest",
  cmd = {"Ultest", "UltestNearest", "UltestDebugNearest", "UltestSummary", "UltestOutput", "UltestClear", "UltestStop"},
  after = "nvim-dap",
  requires = {"vim-test/vim-test"},
  run = ":UpdateRemotePlugins",
  setup = require("config.ultest").setup,
  config = require("config.ultest").config,
})

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
  event = "BufRead",
  after = "telescope.nvim",
  run = "TSUpdate",
  config = require("config.treesitter").config,
})

return packer.setup()
