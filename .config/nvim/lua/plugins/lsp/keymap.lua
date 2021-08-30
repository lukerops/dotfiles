local set_keymap = vim.api.nvim_set_keymap
local M = {}

function M.lspconfig()
  set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
  set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {noremap = true, silent = true})
  set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true, silent = true})
  set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true, silent = true})

  set_keymap('n', '<leader>ft', '<cmd>lua vim.lsp.buf.formatting()<CR>', {noremap = true, silent = true})
  set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true, silent = true})
end

function M.compe()
  local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end
  
  local function check_back_space()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
  end
  
  -- Use (s-)tab to:
  --- move to prev/next item in completion menuone
  --- jump to prev/next snippet's placeholder
  _G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t('<C-n>')
    elseif check_back_space() then
      return t('<Tab>')
    else
      return vim.fn['compe#complete']()
    end
  end
  
  _G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t('<C-p>')
    else
      -- If <S-Tab> is not working in your terminal, change it to <C-h>
      return t('<S-Tab>')
    end
  end

  set_keymap('i', '<C-Space>', [[ compe#complete() ]], {noremap = true, silent = true, expr = true})
  set_keymap('i', '<CR>', [[ compe#confirm('<CR>') ]], {noremap = true, silent = true, expr = true})
  set_keymap('i', '<C-e>', [[ compe#close('<C-e>') ]], {noremap = true, silent = true, expr = true})

  -- see utils.lua for tab_complete and s_tab_complete
  set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
  set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
  set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
  set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
end

function M.trouble()
  set_keymap('n', "<leader>tb", "<cmd>Trouble<cr>", {silent = true, noremap = true})
end

return M
