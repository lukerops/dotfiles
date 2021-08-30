local M = {}

function M.config()
  vim.o.completeopt = "menuone,noselect"

  require("compe").setup({
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = "enable",
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,

    source = {
      path = true,
      buffer = false,
      calc = false,
      nvim_lsp = true,
      nvim_lua = true,
      vsnip = false,
      ultisnips = false,
      snippets_nvim = true,
    },
  })

  -- keymaps
  local utils = require("utils")

  local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end
  
  local function check_back_space()
    local col = vim.fn.col(".") - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
  end
  
  -- Use (s-)tab to:
  --- move to prev/next item in completion menuone
  --- jump to prev/next snippet"s placeholder
  _G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t("<C-n>")
    elseif check_back_space() then
      return t("<Tab>")
    else
      return vim.fn["compe#complete"]()
    end
  end
  
  _G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t("<C-p>")
    else
      -- If <S-Tab> is not working in your terminal, change it to <C-h>
      return t("<S-Tab>")
    end
  end

  opts = { expr = true }
  utils.inoremap("<C-Space>", [[ compe#complete() ]], opts)
  utils.inoremap("<CR>", [[ compe#confirm("<CR>") ]], opts)
  utils.inoremap("<C-e>", [[ compe#close("<C-e>") ]], opts)

  -- see utils.lua for tab_complete and s_tab_complete
  utils.inoremap("<Tab>", "v:lua.tab_complete()", opts)
  utils.snoremap("<Tab>", "v:lua.tab_complete()", opts)
  utils.inoremap("<S-Tab>", "v:lua.s_tab_complete()", opts)
  utils.snoremap("<S-Tab>", "v:lua.s_tab_complete()", opts)
end

return M
