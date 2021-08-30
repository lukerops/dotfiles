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
  after = "nvim-compe",
  config = require("config.lsp.lspkind").config,
})

-- Telescope
packer.add({
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  after = "onedark.nvim",
  requires = {
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
  },
  setup = require("config.telescope").setup,
  config = require("config.telescope").config,
})

-- Utils
packer.add({
  "kyazdani42/nvim-tree.lua",
  cmd = {"NvimTreeToggle","NvimTreeOpen"},
  after = "onedark.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  setup = require("config.nvimtree").setup,
})

packer.add({
  "akinsho/toggleterm.nvim",
  opt = false,
  -- cmd = {"ToggleTerm"},
  config = require("config.toggleterm").config,
})

-- Tests
packer.add({
  "rcarriga/vim-ultest",
  cmd = {"Ultest", "UltestNearest", "UltestSummary", "UltestOutput", "UltestClear", "UltestStop"},
  requires = {"vim-test/vim-test"},
  run = ":UpdateRemotePlugins",
  setup = require("config.ultest").config,
})

-- Git
packer.add({
  "lewis6991/gitsigns.nvim",
  after = "onedark.nvim",
  requires = "nvim-lua/plenary.nvim",
  config = require("config.gitsigns").config,
})

packer.add({
  "sindrets/diffview.nvim",
  config = require("config.diffview").config,
})

-- Style
packer.add({
  "navarasu/onedark.nvim",
  config = require("config.onedark").config,
})

packer.add({
  "folke/lsp-colors.nvim",
})

packer.add({
  "akinsho/nvim-bufferline.lua",
  after = "onedark.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = require("config.bufferline").config,
})

packer.add({
  "hoob3rt/lualine.nvim",
  after = "onedark.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = require("config.lualine").config,
})

packer.add({
  "nvim-treesitter/nvim-treesitter",
  cmd = {"TSInstall","TSInstallInfo", "TSUpdate"},
  event = "BufRead",
  after = {"onedark.nvim", "telescope.nvim"},
  run = "TSUpdate",
  config = require("config.treesitter").config,
})

return packer.setup()
