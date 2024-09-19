return {
  'stevearc/overseer.nvim',
  dependencies = { "stevearc/dressing.nvim" },
  cmd = { "OverseerRun", "OverseerToggle" },
  opts = {
    templates = {
      "cargo",
      "just",
      -- "make",
      "npm",
      "shell",
      "tox",
      "vscode",
      "mage",
      "mix",
      "deno",
      "rake",
      "task",
      "composer",
      "cargo-make",
      "myplugin.make",
    },
  },
}
