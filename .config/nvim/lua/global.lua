vim.o.termguicolors = true
vim.o.ignorecase = true
vim.o.encoding = "utf-8"
vim.o.clipboard = "unnamedplus"
vim.o.mouse = "a"
vim.wo.number = true
vim.wo.cursorline = true
vim.wo.signcolumn = "yes"

-- keymaps
local utils = require("utils")

utils.nnoremap("<leader>1",   "<cmd>tabnext 1<cr>")
utils.nnoremap("<leader>2",   "<cmd>tabnext 2<cr>")
utils.nnoremap("<leader>3",   "<cmd>tabnext 3<cr>")
utils.nnoremap("<leader>4",   "<cmd>tabnext 4<cr>")
utils.nnoremap("<leader>5",   "<cmd>tabnext 5<cr>")
utils.nnoremap("<leader>6",   "<cmd>tabnext 6<cr>")
utils.nnoremap("<leader>7",   "<cmd>tabnext 7<cr>")
utils.nnoremap("<leader>8",   "<cmd>tabnext 8<cr>")
utils.nnoremap("<leader>9",   "<cmd>tabnext 9<cr>")
utils.nnoremap("<leader>0",   "<cmd>tablast<cr>")
utils.nnoremap("<leader>tbn", "<cmd>tabnew<cr>")