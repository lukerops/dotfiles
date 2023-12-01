vim.keymap.set("n", "<M-Up>", ":m .-2<CR>==", { noremap = true })
vim.keymap.set("n", "<M-Down>", ":m .+1<CR>==", { noremap = true })
vim.keymap.set("i", "<M-Up>", "<Esc>:m .-2<CR>==gi", { noremap = true })
vim.keymap.set("i", "<M-Down>", "<Esc>:m .+1<CR>==gi", { noremap = true })
vim.keymap.set("v", "<M-Up>", ":m '<-2<CR>==gv", { noremap = true })
vim.keymap.set("v", "<M-Down>", ":m '>+1<CR>==gv", { noremap = true })

-- Adiciona suporte ao Lazygit
vim.keymap.set("n", "<leader>go", function() require("lazy.util").float_term("lazygit") end, { desc = "Open Lazygit" })
