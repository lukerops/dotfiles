-- disable line number when in terminal
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.o.number = false
  end,
})

vim.opt.hidden = true
vim.opt.title = true

-- global statusbar
vim.opt.laststatus = 3

vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.encoding = "utf-8"
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

vim.cmd([[
set noswapfile
set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20,o:hor50
]])

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

utils.nnoremap("<M-Up>", ":m .-2<CR>==")
utils.nnoremap("<M-Down>", ":m .+1<CR>==")
utils.inoremap("<M-Up>", "<Esc>:m .-2<CR>==gi")
utils.inoremap("<M-Down>", "<Esc>:m .+1<CR>==gi")
utils.vnoremap("<M-Up>", ":m '<-2<CR>==gv")
utils.vnoremap("<M-Down>", ":m '>+1<CR>==gv")
