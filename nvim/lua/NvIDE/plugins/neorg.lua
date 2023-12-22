return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "Neorg" },
  opts = {
    load = {
      ["core.defaults"] = {},  -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.esupports.metagen"] = { config = { type = "auto" } },
      ["core.dirman"] = {      -- Manages Neorg workspaces
        config = {
          default_workspace = "annotations",
          workspaces = {
            annotations = "~/git/github.com/lukerops/annotations",
          },
        },
      },
      ["core.summary"] = {},
      ["core.ui.calendar"] = {},
      ["core.export"] = {},
      ["core.export.markdown"] = {},
      ["core.completion"] = { config = { engine = "nvim-cmp" } },
    },
  },
}
