require("NvIDE.lazy")
require("NvIDE.keymaps")

-- global statusbar
vim.opt.laststatus = 3

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true

vim.opt.hidden = true
vim.opt.title = true

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.encoding = "utf-8"

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

-- fix tab width for some filetypes
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*.tf", "*.lua" },
  callback = function()
    vim.bo.shiftwidth = 2
  end,
})
