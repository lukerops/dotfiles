return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  -- event = "VeryLazy",
  lazy = true,
  tag = "0.1.2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", },
  keys = {
    { "<leader>/",  "<cmd>Telescope live_grep<cr>",       desc = "Find in Files (Grep)" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>",      desc = "Find Files" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",         desc = "Buffers" },
    { "<leader>gb", "<cmd>Telescope git_branches<CR>",    desc = "Git Branches" },
    { "<leader>gc", "<cmd>Telescope git_commits<CR>",     desc = "Git Commits" },
    { "<leader>gs", "<cmd>Telescope git_status<CR>",      desc = "Git Status" },
    { "<leader>sh", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    { "<leader>sH", "<cmd>Telescope help_tags<cr>",       desc = "Help Pages" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>",         desc = "Key Maps" },
  },
  opts = function()
    local telescopeConfig = require("telescope.config")

    -- Clone the default Telescope configuration
    local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

    -- I want to search in hidden/dot files.
    table.insert(vimgrep_arguments, "--hidden")
    -- I don't want to search in the `.git` directory.
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!**/.git/*")

    local actions = require("telescope.actions")

    return {
      defaults = {
        vimgrep_arguments = vimgrep_arguments,
        mappings = {
          i = {
            ["<c-t>"] = require("trouble.providers.telescope").open_with_trouble,
            ["<C-Up>"] = actions.preview_scrolling_up,
            ["<C-Down>"] = actions.preview_scrolling_down,
          },
          n = {
            ["<C-Up>"] = actions.preview_scrolling_up,
            ["<C-Down>"] = actions.preview_scrolling_down,
          },
        },
      },
      pickers = {
        find_files = {
          -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
        buffers = {
          mappings = {
            i = {
              ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
            },
            n = {
              ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
            },
          },
        },
      },
    }
  end,
  -- init = function()
  --   require("telescope").load_extension("notify")
  -- end,
}
