-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/lucas/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/lucas/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/lucas/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/lucas/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/lucas/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/lucas/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    after_files = { "/home/lucas/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    after = { "nvim-lspconfig" },
    after_files = { "/home/lucas/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    after_files = { "/home/lucas/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    after_files = { "/home/lucas/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  colortheme = {
    after = { "nvim-bufferline.lua", "lualine.nvim", "gitsigns.nvim", "nvim-tree.lua", "nvim-scrollbar", "telescope.nvim" },
    config = { "\27LJ\2\nh\0\0\3\0\5\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0'\2\4\0B\0\2\1K\0\1\0\27colorscheme tokyonight\bcmd tokyonight_italic_functions\6g\bvim\0" },
    loaded = true,
    only_config = true,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/start/colortheme",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["diffview.nvim"] = {
    config = { "\27LJ\2\na\0\0\3\1\4\0\0156\0\0\0'\2\1\0B\0\2\2-\1\0\0\14\0\1\0X\1\3Ä9\1\2\0B\1\1\1X\1\2Ä9\1\3\0B\1\1\1-\1\0\0\19\1\1\0.\0\1\0K\0\1\0\1Ä\nclose\topen\rdiffview\frequire±\1\1\0\6\0\t\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\2+\1\1\0003\2\4\0007\2\5\0009\2\6\0'\4\a\0'\5\b\0B\2\3\0012\0\0ÄK\0\1\0#<cmd>lua toggle_diffview()<CR>\16<leader>gtd\rnnoremap\20toggle_diffview\0\nutils\nsetup\rdiffview\frequire\0" },
    loaded = true,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n•\4\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\3=\3\15\2B\0\2\1K\0\1\0\nsigns\17changedelete\1\0\4\ttext\6|\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\14topdelete\1\0\4\ttext\6|\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\vdelete\1\0\4\ttext\6|\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\vchange\1\0\4\ttext\b‚îÇ\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\badd\1\0\0\1\0\4\ttext\b‚îÇ\ahl\16GitSignsAdd\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\1\0\1\23current_line_blame\2\nsetup\rgitsigns\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n¸\1\0\0\4\0\v\0\0256\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0009\0\3\0\18\2\0\0009\0\4\0'\3\5\0B\0\3\0016\0\0\0009\0\1\0009\0\3\0\18\2\0\0009\0\4\0'\3\6\0B\0\3\0016\0\a\0'\2\b\0B\0\2\0029\0\t\0005\2\n\0B\0\2\1K\0\1\0\1\0\3\25show_current_context\2\25space_char_blankline\6 \21show_end_of_line\2\nsetup\21indent_blankline\frequire\feol:‚Ü¥\14space:‚ãÖ\vappend\14listchars\tlist\bopt\bvim\0" },
    loaded = true,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\n\127\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\17handler_opts\1\0\1\vborder\vsingle\1\0\2\15toggle_key\n<M-s>\tbind\2\nsetup\18lsp_signature\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n∆\5\0\0\5\0 \0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\3=\3\v\0025\3\r\0005\4\f\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\3=\3\25\0025\3\26\0004\4\0\0=\4\14\0034\4\0\0=\4\16\0035\4\27\0=\4\18\0035\4\28\0=\4\20\0034\4\0\0=\4\22\0034\4\0\0=\4\24\3=\3\29\0024\3\0\0=\3\30\0024\3\0\0=\3\31\2B\0\2\1K\0\1\0\15extensions\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\1\f\0\0\rNvimTree\vpacker\18UltestSummary\18DiffviewFiles\15toggleterm\fTrouble\18dapui_watches\17dapui_stacks\22dapui_breakpoints\17dapui_scopes\rdap-repl\23section_separators\1\3\0\0\bÓÇ∞\bÓÇ≤\25component_separators\1\3\0\0\bÓÇ±\bÓÇ≥\1\0\2\18icons_enabled\2\ntheme\15tokyonight\nsetup\flualine\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/hoob3rt/lualine.nvim"
  },
  neotest = {
    config = { "\27LJ\2\nµ\5\0\0\b\0\21\1(6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0004\3\3\0006\4\0\0'\6\3\0B\4\2\0025\6\5\0005\a\4\0=\a\6\6B\4\2\0?\4\0\0=\3\b\2B\0\2\0016\0\0\0'\2\t\0B\0\2\0029\1\n\0'\3\v\0'\4\f\0B\1\3\0019\1\n\0'\3\r\0'\4\14\0B\1\3\0019\1\n\0'\3\15\0'\4\16\0B\1\3\0019\1\n\0'\3\17\0'\4\18\0B\1\3\0019\1\n\0'\3\19\0'\4\20\0B\1\3\1K\0\1\0T<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>\17<leader>tdbg5<cmd>lua require('neotest').summary.toggle()<cr>\15<leader>tsB<cmd>lua require('neotest').output.open({ enter = true })<cr>\15<leader>toP<cmd>lua require('neotest').run.run({env = require('utils.envs').envs})<cr>\15<leader>tnd<cmd>lua require('neotest').run.run({vim.fn.expand('%'), env = require('utils.envs').envs})<cr>\15<leader>tf\rnnoremap\nutils\radapters\1\0\0\bdap\1\0\1\vrunner\vpytest\1\0\1\15justMyCode\1\19neotest-python\nsetup\fneotest\frequire\3ÄÄ¿ô\4\0" },
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/opt/neotest",
    url = "https://github.com/nvim-neotest/neotest"
  },
  ["neotest-python"] = {
    loaded = true,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/start/neotest-python",
    url = "https://github.com/nvim-neotest/neotest-python"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n\127\0\4\14\0\a\0\21'\4\0\0006\5\1\0\18\a\2\0B\5\2\4H\b\rÄ\a\b\2\0X\n\2Ä'\n\3\0X\v\5Ä\a\b\4\0X\n\2Ä'\n\5\0X\v\1Ä'\n\6\0\18\v\4\0\18\f\t\0\18\r\n\0&\4\r\vF\b\3\3R\bÒ\127L\4\2\0\bÔÑ©\tÔÅ± \fwarning\tÔÅó \nerror\npairs\6 Í\5\1\0\6\0\28\00025\0\0\0003\1\1\0=\1\2\0006\1\3\0'\3\4\0B\1\2\0029\1\5\0015\3\6\0=\0\a\3B\1\2\0016\1\3\0'\3\b\0B\1\2\0029\2\t\1'\4\n\0'\5\v\0B\2\3\0019\2\t\1'\4\f\0'\5\r\0B\2\3\0019\2\t\1'\4\14\0'\5\15\0B\2\3\0019\2\t\1'\4\16\0'\5\17\0B\2\3\0019\2\t\1'\4\18\0'\5\19\0B\2\3\0019\2\t\1'\4\20\0'\5\21\0B\2\3\0019\2\t\1'\4\22\0'\5\23\0B\2\3\0019\2\t\1'\4\24\0'\5\25\0B\2\3\0019\2\t\1'\4\26\0'\5\27\0B\2\3\1K\0\1\0$<cmd>BufferLineGoToBuffer 9<cr>\14<leader>9$<cmd>BufferLineGoToBuffer 8<cr>\14<leader>8$<cmd>BufferLineGoToBuffer 7<cr>\14<leader>7$<cmd>BufferLineGoToBuffer 6<cr>\14<leader>6$<cmd>BufferLineGoToBuffer 5<cr>\14<leader>5$<cmd>BufferLineGoToBuffer 4<cr>\14<leader>4$<cmd>BufferLineGoToBuffer 3<cr>\14<leader>3$<cmd>BufferLineGoToBuffer 2<cr>\14<leader>2$<cmd>BufferLineGoToBuffer 1<cr>\14<leader>1\rnnoremap\nutils\foptions\1\0\0\nsetup\15bufferline\frequire\26diagnostics_indicator\0\1\0\4\16diagnostics\rnvim_lsp\20separator_style\nthick\27always_show_bufferline\2\20show_close_icon\2\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/opt/nvim-bufferline.lua",
    url = "https://github.com/akinsho/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    after = { "cmp-nvim-lsp", "cmp-cmdline", "cmp-path", "cmp_luasnip", "cmp-buffer" },
    config = { "\27LJ\2\n/\0\2\4\1\2\0\a9\2\1\1=\2\0\1-\2\0\0009\3\1\0018\2\3\2=\2\1\1L\1\2\0\2¿\tkind\tmenu-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1¿\tbody\15lsp_expandö\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\vÄ-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\tjump\rjumpable\21select_prev_item\fvisible≈\t\1\0\f\0;\0{6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0026\1\4\0'\3\6\0B\1\2\0025\2\a\0009\3\b\0005\5\14\0005\6\n\0005\a\t\0=\a\v\0063\a\f\0=\a\r\6=\6\15\0055\6\17\0003\a\16\0=\a\18\6=\6\19\0055\6\23\0009\a\20\0009\t\20\0009\t\21\t)\v¸ˇB\t\2\0025\n\22\0B\a\3\2=\a\24\0069\a\20\0009\t\20\0009\t\21\t)\v\4\0B\t\2\0025\n\25\0B\a\3\2=\a\26\0069\a\20\0009\t\20\0009\t\27\tB\t\1\0025\n\28\0B\a\3\2=\a\29\0069\a\30\0009\a\31\a=\a \0069\a\20\0005\t\"\0009\n\20\0009\n!\nB\n\1\2=\n#\t9\n\20\0009\n$\nB\n\1\2=\n%\tB\a\2\2=\a&\0069\a\20\0009\a'\a5\t(\0B\a\2\2=\a)\0069\a\20\0003\t*\0005\n+\0B\a\3\2=\a\26\0069\a\20\0003\t,\0005\n-\0B\a\3\2=\a\24\6=\6\20\0059\6\30\0009\6.\0064\b\4\0005\t/\0>\t\1\b5\t0\0>\t\2\b5\t1\0>\t\3\b4\t\3\0005\n2\0>\n\1\tB\6\3\2=\6.\5B\3\2\0019\3\b\0009\0033\3'\0054\0005\0066\0009\a\20\0009\a5\a9\a3\aB\a\1\2=\a\20\0064\a\3\0005\b7\0>\b\1\a=\a.\6B\3\3\0019\3\b\0009\0033\3'\0058\0005\0069\0009\a\20\0009\a5\a9\a3\aB\a\1\2=\a\20\0064\a\3\0005\b:\0>\b\1\a=\a.\6B\3\3\0012\0\0ÄK\0\1\0\1\0\1\tname\fcmdline\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\vpreset\6/\fcmdline\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\1\3\0\0\6i\6c\0\1\3\0\0\6i\6c\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-y>\fdisable\vconfig\14<C-Space>\1\3\0\0\6i\6c\rcomplete\r<C-Down>\1\3\0\0\6i\6c\v<C-Up>\1\0\0\1\3\0\0\6i\6c\16scroll_docs\fmapping\fsnippet\vexpand\1\0\0\0\15formatting\1\0\0\vformat\0\vfields\1\0\0\1\4\0\0\tkind\tabbr\tmenu\nsetup\1\0\25\nValue\bÔ¢ü\rConstant\bÔ£ø\tUnit\bÔ•¨\rProperty\bÔ∞†\vStruct\bÔ≠Ñ\vModule\bÔ£í\nEvent\bÔÉß\14Interface\bÔÉ®\rOperator\bÔöî\nClass\bÔ¥Ø\18TypeParameter\5\rVariable\bÔúõ\nField\bÔ∞†\16Constructor\b‚åò\15EnumMember\bÔÖù\rFunction\bÔûî\vFolder\bÔÅª\vMethod\bÔö¶\14Reference\bÔúÜ\tText\bÔÉâ\tFile\bÔúò\nColor\bÔ£ó\fSnippet\bÔô∞\fKeyword\bÔ®ã\tEnum\bÔÖù\fluasnip\bcmp\frequire\21menuone,noselect\16completeopt\6o\bvim\0" },
    loaded = true,
    only_config = true,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    after = { "neotest" },
    config = { "\27LJ\2\nÈ\5\0\0\6\0\25\0,6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\2\4\0005\3\5\0=\3\6\2=\2\3\0016\1\0\0'\3\a\0B\1\2\0029\2\b\1'\4\t\0'\5\n\0B\2\3\0019\2\b\1'\4\v\0'\5\f\0B\2\3\0019\2\b\1'\4\r\0'\5\14\0B\2\3\0019\2\b\1'\4\15\0'\5\16\0B\2\3\0019\2\b\1'\4\17\0'\5\18\0B\2\3\0019\2\b\1'\4\19\0'\5\20\0B\2\3\0019\2\b\1'\4\21\0'\5\22\0B\2\3\0019\2\b\1'\4\23\0'\5\24\0B\2\3\1K\0\1\0c<cmd>lua local widgets = require('dap.ui.widgets'); widgets.centered_float(widgets.scopes)<cr>\18<leader>dbgsc3<cmd>lua require('dap.ui.widgets').hover()<cr>\17<leader>dbgh'<cmd>lua require('dap').stop()<cr>\v<C-F5>+<cmd>lua require('dap').step_out()<cr>\f<C-F11>,<cmd>lua require('dap').step_into()<cr>\n<F11>,<cmd>lua require('dap').step_over()<cr>\n<F10>+<cmd>lua require('dap').continue()<cr>\t<F5>4<cmd>lua require('dap').toggle_breakpoint()<cr>\18<leader>dbgbk\rnnoremap\nutils\targs\1\3\0\0\a-m\20debugpy.adapter\1\0\2\ttype\15executable\fcommand\fpython3\vpython\radapters\bdap\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\nË\1\0\0\5\0\t\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\1\4\0'\3\5\0'\4\6\0B\1\3\0019\1\4\0'\3\a\0'\4\b\0B\1\3\1K\0\1\0:<cmd>lua require('dapui').float_element('scopes')<cr>\19<leader>dbgscp+<cmd>lua require('dapui').toggle()<cr>\18<leader>dbgui\rnnoremap\nutils\nsetup\ndapui\frequire\0" },
    loaded = true,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lspconfig"] = {
    after = { "lsp_signature.nvim" },
    config = { "\27LJ\2\nH\0\2\6\0\3\0\b6\2\0\0'\4\1\0B\2\2\0029\2\2\2\18\4\0\0\18\5\1\0B\2\3\1K\0\1\0\nsetup\23config.lsp.keymaps\frequireõ\b\1\0\17\0005\0\\6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\t\0005\3\n\0B\0\3\0016\0\0\0009\0\v\0009\0\f\0006\1\0\0009\1\v\0019\1\14\0016\3\0\0009\3\v\0039\3\15\0039\3\16\0035\4\17\0B\1\3\2=\1\r\0006\0\18\0'\2\19\0B\0\2\0029\0\20\0B\0\1\0023\1\21\0005\2\22\0=\1\23\2=\0\24\0025\3 \0005\4\30\0005\5\28\0005\6\25\0005\a\26\0=\a\27\6=\6\29\5=\5\31\4=\4\29\0035\4\"\0005\5!\0=\5#\0045\5-\0005\6%\0005\a$\0=\a&\0065\a(\0005\b'\0=\b)\a5\b*\0=\b+\a=\a,\6=\6.\5=\5\31\4=\4.\0034\4\0\0=\4/\0036\4\18\0'\0060\0B\4\2\0026\0051\0\18\a\3\0B\5\2\4H\b\tÄ8\n\b\0049\n2\n6\f\0\0009\f3\f'\0144\0\18\15\2\0\18\16\t\0B\f\4\0A\n\0\1F\b\3\3R\bı\127K\0\1\0\nforce\20tbl_deep_extend\nsetup\npairs\14lspconfig\16terraformls\npylsp\1\0\0\fplugins\16pycodestyle\1\0\1\fenabled\1\vflake8\1\0\0\1\0\1\fenabled\2\25configurationSources\1\0\0\1\2\0\0\vflake8\bcmd\1\0\0\1\6\0\0$/home/lucas/.pyenv/shims/python\a-m\vpoetry\brun\npylsp\1\0\0\rsettings\1\0\0\ngopls\1\0\0\ranalyses\1\0\1\17unusedparams\2\1\0\2\20usePlaceholders\2\16staticcheck\2\17capabilities\14on_attach\1\0\0\0\25default_capabilities\17cmp_nvim_lsp\frequire\1\0\4\14underline\2\21update_in_insert\2\nsigns\2\17virtual_text\2\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\blsp\1\0\1\ttext\bÔÅô\27LspDiagnosticsSignHint\1\0\1\ttext\bÔÅö\"LspDiagnosticsSignInformation\1\0\1\ttext\bÔÅ±\30LspDiagnosticsSignWarning\1\0\1\ttext\bÔÅó\28LspDiagnosticsSignError\16sign_define\afn\bvim\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-scrollbar"] = {
    config = { "\27LJ\2\n€\2\0\0\a\0\29\0*6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0026\1\0\0'\3\3\0B\1\2\0029\1\2\0015\3\a\0005\4\5\0009\5\4\0=\5\6\4=\4\b\0035\4\v\0005\5\n\0009\6\t\0=\6\6\5=\5\f\0045\5\14\0009\6\r\0=\6\6\5=\5\15\0045\5\17\0009\6\16\0=\6\6\5=\5\18\0045\5\20\0009\6\19\0=\6\6\5=\5\21\0045\5\23\0009\6\22\0=\6\6\5=\5\24\0045\5\26\0009\6\25\0=\6\6\5=\5\27\4=\4\28\3B\1\2\1K\0\1\0\nmarks\tMisc\1\0\0\vpurple\tHint\1\0\0\thint\tInfo\1\0\0\tinfo\tWarn\1\0\0\fwarning\nError\1\0\0\nerror\vSearch\1\0\0\1\0\0\vorange\vhandle\1\0\0\ncolor\1\0\0\17bg_highlight\14scrollbar\nsetup\22tokyonight.colors\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/opt/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeOpen" },
    config = { "\27LJ\2\n’\1\0\0\6\0\t\0\0166\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\1\0B\1\2\0029\1\2\0015\3\a\0005\4\3\0005\5\4\0=\5\5\0044\5\0\0=\5\6\4=\4\b\3B\1\2\1K\0\1\0\ffilters\1\0\0\fexclude\vcustom\1\a\0\0\f^\\.git$\19^node_modules$\14^\\.cache$\21^\\.pytest_cache$\15^\\.vscode$\18^__pycache__$\1\0\1\rdotfiles\1\nsetup\14nvim-tree\frequire\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-ts-rainbow", "nvim-treesitter-textobjects", "telescope.nvim" },
    commands = { "TSInstall", "TSInstallInfo", "TSUpdate" },
    config = { "\27LJ\2\ná\2\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\frainbow\1\0\2\venable\2\18extended_mode\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\14\0\0\ago\15javascript\15typescript\vpython\fgraphql\tjson\tyaml\blua\tbash\15dockerfile\nquery\nregex\ttoml\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-rainbow"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["telescope-dap.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bdap\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/opt/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-dap.nvim" },
    commands = { "Telescope" },
    config = { "\27LJ\2\n˙\1\0\0\b\0\17\0\0266\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\15\0005\4\r\0005\5\t\0005\6\5\0009\a\4\0=\a\6\0069\a\a\0=\a\b\6=\6\n\0055\6\v\0009\a\4\0=\a\6\0069\a\a\0=\a\b\6=\6\f\5=\5\14\4=\4\16\3B\1\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6n\1\0\0\6i\1\0\0\r<C-Down>\27preview_scrolling_down\v<C-Up>\1\0\0\25preview_scrolling_up\nsetup\14telescope\22telescope.actions\frequire\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    commands = { "TodoTrouble", "TodoLocList" },
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    load_after = {
      ["trouble.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n$\0\0\3\1\1\0\5-\0\0\0\18\2\0\0009\0\0\0B\0\2\1K\0\1\0\2¿\vtoggle$\0\0\3\1\1\0\5-\0\0\0\18\2\0\0009\0\0\0B\0\2\1K\0\1\0\3¿\vtoggleÜ\4\1\0\b\0\21\0%6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0026\1\0\0'\3\a\0B\1\2\0029\1\b\1\18\4\1\0009\2\t\0015\5\n\0B\2\3\0023\3\v\0007\3\f\0009\3\r\0'\5\14\0'\6\15\0B\3\3\1\18\5\1\0009\3\t\0015\6\16\0B\3\3\0023\4\17\0007\4\18\0009\4\r\0'\6\19\0'\a\20\0B\4\3\0012\0\0ÄK\0\1\0#<cmd>lua toggle_gitgraph()<CR>\16<leader>gtg\20toggle_gitgraph\0\1\0\3\vhidden\2\14direction\nfloat\bcmd)git log --graph --pretty=short --all\"<cmd>lua toggle_lazygit()<CR>\15<leader>gt\rnnoremap\19toggle_lazygit\0\1\0\3\vhidden\2\14direction\nfloat\bcmd\flazygit\bnew\rTerminal\24toggleterm.terminal\nutils\15float_opts\1\0\1\vborder\vcurved\1\0\2\17open_mapping\n<C-t>\14direction\nfloat\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    after = { "todo-comments.nvim" },
    commands = { "Trouble" },
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-multiple-cursors"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/lucas/.local/share/nvim/site/pack/packer/opt/vim-multiple-cursors",
    url = "https://github.com/terryma/vim-multiple-cursors"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: todo-comments.nvim
time([[Setup for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n^\0\0\5\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0'\4\4\0B\1\3\1K\0\1\0\25<cmd>TodoTrouble<cr>\15<leader>td\rnnoremap\nutils\frequire\0", "setup", "todo-comments.nvim")
time([[Setup for todo-comments.nvim]], false)
-- Setup for: trouble.nvim
time([[Setup for trouble.nvim]], true)
try_loadstring("\27LJ\2\nZ\0\0\5\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0'\4\4\0B\1\3\1K\0\1\0\21<cmd>Trouble<cr>\15<leader>tb\rnnoremap\nutils\frequire\0", "setup", "trouble.nvim")
time([[Setup for trouble.nvim]], false)
-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
try_loadstring("\27LJ\2\n—\1\0\0\5\0\t\0\0166\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0'\4\4\0B\1\3\0019\1\2\0'\3\5\0'\4\6\0B\1\3\0019\1\2\0'\3\a\0'\4\b\0B\1\3\1K\0\1\0\"<cmd>Telescope git_status<CR>\16<leader>gts!<cmd>Telescope live_grep<CR>\f<M-C-F>\"<cmd>Telescope find_files<CR>\n<C-p>\rnnoremap\nutils\frequire\0", "setup", "telescope.nvim")
time([[Setup for telescope.nvim]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nU\0\0\5\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0'\4\4\0B\1\3\1K\0\1\0\24:NvimTreeToggle<CR>\ant\rnnoremap\nutils\frequire\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n/\0\2\4\1\2\0\a9\2\1\1=\2\0\1-\2\0\0009\3\1\0018\2\3\2=\2\1\1L\1\2\0\2¿\tkind\tmenu-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1¿\tbody\15lsp_expandö\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\vÄ-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\tjump\rjumpable\21select_prev_item\fvisible≈\t\1\0\f\0;\0{6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0026\1\4\0'\3\6\0B\1\2\0025\2\a\0009\3\b\0005\5\14\0005\6\n\0005\a\t\0=\a\v\0063\a\f\0=\a\r\6=\6\15\0055\6\17\0003\a\16\0=\a\18\6=\6\19\0055\6\23\0009\a\20\0009\t\20\0009\t\21\t)\v¸ˇB\t\2\0025\n\22\0B\a\3\2=\a\24\0069\a\20\0009\t\20\0009\t\21\t)\v\4\0B\t\2\0025\n\25\0B\a\3\2=\a\26\0069\a\20\0009\t\20\0009\t\27\tB\t\1\0025\n\28\0B\a\3\2=\a\29\0069\a\30\0009\a\31\a=\a \0069\a\20\0005\t\"\0009\n\20\0009\n!\nB\n\1\2=\n#\t9\n\20\0009\n$\nB\n\1\2=\n%\tB\a\2\2=\a&\0069\a\20\0009\a'\a5\t(\0B\a\2\2=\a)\0069\a\20\0003\t*\0005\n+\0B\a\3\2=\a\26\0069\a\20\0003\t,\0005\n-\0B\a\3\2=\a\24\6=\6\20\0059\6\30\0009\6.\0064\b\4\0005\t/\0>\t\1\b5\t0\0>\t\2\b5\t1\0>\t\3\b4\t\3\0005\n2\0>\n\1\tB\6\3\2=\6.\5B\3\2\0019\3\b\0009\0033\3'\0054\0005\0066\0009\a\20\0009\a5\a9\a3\aB\a\1\2=\a\20\0064\a\3\0005\b7\0>\b\1\a=\a.\6B\3\3\0019\3\b\0009\0033\3'\0058\0005\0069\0009\a\20\0009\a5\a9\a3\aB\a\1\2=\a\20\0064\a\3\0005\b:\0>\b\1\a=\a.\6B\3\3\0012\0\0ÄK\0\1\0\1\0\1\tname\fcmdline\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\vpreset\6/\fcmdline\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\1\3\0\0\6i\6c\0\1\3\0\0\6i\6c\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-y>\fdisable\vconfig\14<C-Space>\1\3\0\0\6i\6c\rcomplete\r<C-Down>\1\3\0\0\6i\6c\v<C-Up>\1\0\0\1\3\0\0\6i\6c\16scroll_docs\fmapping\fsnippet\vexpand\1\0\0\0\15formatting\1\0\0\vformat\0\vfields\1\0\0\1\4\0\0\tkind\tabbr\tmenu\nsetup\1\0\25\nValue\bÔ¢ü\rConstant\bÔ£ø\tUnit\bÔ•¨\rProperty\bÔ∞†\vStruct\bÔ≠Ñ\vModule\bÔ£í\nEvent\bÔÉß\14Interface\bÔÉ®\rOperator\bÔöî\nClass\bÔ¥Ø\18TypeParameter\5\rVariable\bÔúõ\nField\bÔ∞†\16Constructor\b‚åò\15EnumMember\bÔÖù\rFunction\bÔûî\vFolder\bÔÅª\vMethod\bÔö¶\14Reference\bÔúÜ\tText\bÔÉâ\tFile\bÔúò\nColor\bÔ£ó\fSnippet\bÔô∞\fKeyword\bÔ®ã\tEnum\bÔÖù\fluasnip\bcmp\frequire\21menuone,noselect\16completeopt\6o\bvim\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: diffview.nvim
time([[Config for diffview.nvim]], true)
try_loadstring("\27LJ\2\na\0\0\3\1\4\0\0156\0\0\0'\2\1\0B\0\2\2-\1\0\0\14\0\1\0X\1\3Ä9\1\2\0B\1\1\1X\1\2Ä9\1\3\0B\1\1\1-\1\0\0\19\1\1\0.\0\1\0K\0\1\0\1Ä\nclose\topen\rdiffview\frequire±\1\1\0\6\0\t\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\2+\1\1\0003\2\4\0007\2\5\0009\2\6\0'\4\a\0'\5\b\0B\2\3\0012\0\0ÄK\0\1\0#<cmd>lua toggle_diffview()<CR>\16<leader>gtd\rnnoremap\20toggle_diffview\0\nutils\nsetup\rdiffview\frequire\0", "config", "diffview.nvim")
time([[Config for diffview.nvim]], false)
-- Config for: colortheme
time([[Config for colortheme]], true)
try_loadstring("\27LJ\2\nh\0\0\3\0\5\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0'\2\4\0B\0\2\1K\0\1\0\27colorscheme tokyonight\bcmd tokyonight_italic_functions\6g\bvim\0", "config", "colortheme")
time([[Config for colortheme]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\nË\1\0\0\5\0\t\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\1\4\0'\3\5\0'\4\6\0B\1\3\0019\1\4\0'\3\a\0'\4\b\0B\1\3\1K\0\1\0:<cmd>lua require('dapui').float_element('scopes')<cr>\19<leader>dbgscp+<cmd>lua require('dapui').toggle()<cr>\18<leader>dbgui\rnnoremap\nutils\nsetup\ndapui\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n$\0\0\3\1\1\0\5-\0\0\0\18\2\0\0009\0\0\0B\0\2\1K\0\1\0\2¿\vtoggle$\0\0\3\1\1\0\5-\0\0\0\18\2\0\0009\0\0\0B\0\2\1K\0\1\0\3¿\vtoggleÜ\4\1\0\b\0\21\0%6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0026\1\0\0'\3\a\0B\1\2\0029\1\b\1\18\4\1\0009\2\t\0015\5\n\0B\2\3\0023\3\v\0007\3\f\0009\3\r\0'\5\14\0'\6\15\0B\3\3\1\18\5\1\0009\3\t\0015\6\16\0B\3\3\0023\4\17\0007\4\18\0009\4\r\0'\6\19\0'\a\20\0B\4\3\0012\0\0ÄK\0\1\0#<cmd>lua toggle_gitgraph()<CR>\16<leader>gtg\20toggle_gitgraph\0\1\0\3\vhidden\2\14direction\nfloat\bcmd)git log --graph --pretty=short --all\"<cmd>lua toggle_lazygit()<CR>\15<leader>gt\rnnoremap\19toggle_lazygit\0\1\0\3\vhidden\2\14direction\nfloat\bcmd\flazygit\bnew\rTerminal\24toggleterm.terminal\nutils\15float_opts\1\0\1\vborder\vcurved\1\0\2\17open_mapping\n<C-t>\14direction\nfloat\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n¸\1\0\0\4\0\v\0\0256\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0009\0\3\0\18\2\0\0009\0\4\0'\3\5\0B\0\3\0016\0\0\0009\0\1\0009\0\3\0\18\2\0\0009\0\4\0'\3\6\0B\0\3\0016\0\a\0'\2\b\0B\0\2\0029\0\t\0005\2\n\0B\0\2\1K\0\1\0\1\0\3\25show_current_context\2\25space_char_blankline\6 \21show_end_of_line\2\nsetup\21indent_blankline\frequire\feol:‚Ü¥\14space:‚ãÖ\vappend\14listchars\tlist\bopt\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\nÈ\5\0\0\6\0\25\0,6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\2\4\0005\3\5\0=\3\6\2=\2\3\0016\1\0\0'\3\a\0B\1\2\0029\2\b\1'\4\t\0'\5\n\0B\2\3\0019\2\b\1'\4\v\0'\5\f\0B\2\3\0019\2\b\1'\4\r\0'\5\14\0B\2\3\0019\2\b\1'\4\15\0'\5\16\0B\2\3\0019\2\b\1'\4\17\0'\5\18\0B\2\3\0019\2\b\1'\4\19\0'\5\20\0B\2\3\0019\2\b\1'\4\21\0'\5\22\0B\2\3\0019\2\b\1'\4\23\0'\5\24\0B\2\3\1K\0\1\0c<cmd>lua local widgets = require('dap.ui.widgets'); widgets.centered_float(widgets.scopes)<cr>\18<leader>dbgsc3<cmd>lua require('dap.ui.widgets').hover()<cr>\17<leader>dbgh'<cmd>lua require('dap').stop()<cr>\v<C-F5>+<cmd>lua require('dap').step_out()<cr>\f<C-F11>,<cmd>lua require('dap').step_into()<cr>\n<F11>,<cmd>lua require('dap').step_over()<cr>\n<F10>+<cmd>lua require('dap').continue()<cr>\t<F5>4<cmd>lua require('dap').toggle_breakpoint()<cr>\18<leader>dbgbk\rnnoremap\nutils\targs\1\3\0\0\a-m\20debugpy.adapter\1\0\2\ttype\15executable\fcommand\fpython3\vpython\radapters\bdap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-scrollbar ]]

-- Config for: nvim-scrollbar
try_loadstring("\27LJ\2\n€\2\0\0\a\0\29\0*6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0026\1\0\0'\3\3\0B\1\2\0029\1\2\0015\3\a\0005\4\5\0009\5\4\0=\5\6\4=\4\b\0035\4\v\0005\5\n\0009\6\t\0=\6\6\5=\5\f\0045\5\14\0009\6\r\0=\6\6\5=\5\15\0045\5\17\0009\6\16\0=\6\6\5=\5\18\0045\5\20\0009\6\19\0=\6\6\5=\5\21\0045\5\23\0009\6\22\0=\6\6\5=\5\24\0045\5\26\0009\6\25\0=\6\6\5=\5\27\4=\4\28\3B\1\2\1K\0\1\0\nmarks\tMisc\1\0\0\vpurple\tHint\1\0\0\thint\tInfo\1\0\0\tinfo\tWarn\1\0\0\fwarning\nError\1\0\0\nerror\vSearch\1\0\0\1\0\0\vorange\vhandle\1\0\0\ncolor\1\0\0\17bg_highlight\14scrollbar\nsetup\22tokyonight.colors\frequire\0", "config", "nvim-scrollbar")

vim.cmd [[ packadd gitsigns.nvim ]]

-- Config for: gitsigns.nvim
try_loadstring("\27LJ\2\n•\4\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\3=\3\15\2B\0\2\1K\0\1\0\nsigns\17changedelete\1\0\4\ttext\6|\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\14topdelete\1\0\4\ttext\6|\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\vdelete\1\0\4\ttext\6|\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\vchange\1\0\4\ttext\b‚îÇ\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\badd\1\0\0\1\0\4\ttext\b‚îÇ\ahl\16GitSignsAdd\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\1\0\1\23current_line_blame\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")

vim.cmd [[ packadd lualine.nvim ]]

-- Config for: lualine.nvim
try_loadstring("\27LJ\2\n∆\5\0\0\5\0 \0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\3=\3\v\0025\3\r\0005\4\f\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\3=\3\25\0025\3\26\0004\4\0\0=\4\14\0034\4\0\0=\4\16\0035\4\27\0=\4\18\0035\4\28\0=\4\20\0034\4\0\0=\4\22\0034\4\0\0=\4\24\3=\3\29\0024\3\0\0=\3\30\0024\3\0\0=\3\31\2B\0\2\1K\0\1\0\15extensions\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\1\f\0\0\rNvimTree\vpacker\18UltestSummary\18DiffviewFiles\15toggleterm\fTrouble\18dapui_watches\17dapui_stacks\22dapui_breakpoints\17dapui_scopes\rdap-repl\23section_separators\1\3\0\0\bÓÇ∞\bÓÇ≤\25component_separators\1\3\0\0\bÓÇ±\bÓÇ≥\1\0\2\18icons_enabled\2\ntheme\15tokyonight\nsetup\flualine\frequire\0", "config", "lualine.nvim")

vim.cmd [[ packadd nvim-bufferline.lua ]]

-- Config for: nvim-bufferline.lua
try_loadstring("\27LJ\2\n\127\0\4\14\0\a\0\21'\4\0\0006\5\1\0\18\a\2\0B\5\2\4H\b\rÄ\a\b\2\0X\n\2Ä'\n\3\0X\v\5Ä\a\b\4\0X\n\2Ä'\n\5\0X\v\1Ä'\n\6\0\18\v\4\0\18\f\t\0\18\r\n\0&\4\r\vF\b\3\3R\bÒ\127L\4\2\0\bÔÑ©\tÔÅ± \fwarning\tÔÅó \nerror\npairs\6 Í\5\1\0\6\0\28\00025\0\0\0003\1\1\0=\1\2\0006\1\3\0'\3\4\0B\1\2\0029\1\5\0015\3\6\0=\0\a\3B\1\2\0016\1\3\0'\3\b\0B\1\2\0029\2\t\1'\4\n\0'\5\v\0B\2\3\0019\2\t\1'\4\f\0'\5\r\0B\2\3\0019\2\t\1'\4\14\0'\5\15\0B\2\3\0019\2\t\1'\4\16\0'\5\17\0B\2\3\0019\2\t\1'\4\18\0'\5\19\0B\2\3\0019\2\t\1'\4\20\0'\5\21\0B\2\3\0019\2\t\1'\4\22\0'\5\23\0B\2\3\0019\2\t\1'\4\24\0'\5\25\0B\2\3\0019\2\t\1'\4\26\0'\5\27\0B\2\3\1K\0\1\0$<cmd>BufferLineGoToBuffer 9<cr>\14<leader>9$<cmd>BufferLineGoToBuffer 8<cr>\14<leader>8$<cmd>BufferLineGoToBuffer 7<cr>\14<leader>7$<cmd>BufferLineGoToBuffer 6<cr>\14<leader>6$<cmd>BufferLineGoToBuffer 5<cr>\14<leader>5$<cmd>BufferLineGoToBuffer 4<cr>\14<leader>4$<cmd>BufferLineGoToBuffer 3<cr>\14<leader>3$<cmd>BufferLineGoToBuffer 2<cr>\14<leader>2$<cmd>BufferLineGoToBuffer 1<cr>\14<leader>1\rnnoremap\nutils\foptions\1\0\0\nsetup\15bufferline\frequire\26diagnostics_indicator\0\1\0\4\16diagnostics\rnvim_lsp\20separator_style\nthick\27always_show_bufferline\2\20show_close_icon\2\0", "config", "nvim-bufferline.lua")

vim.cmd [[ packadd neotest ]]

-- Config for: neotest
try_loadstring("\27LJ\2\nµ\5\0\0\b\0\21\1(6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0004\3\3\0006\4\0\0'\6\3\0B\4\2\0025\6\5\0005\a\4\0=\a\6\6B\4\2\0?\4\0\0=\3\b\2B\0\2\0016\0\0\0'\2\t\0B\0\2\0029\1\n\0'\3\v\0'\4\f\0B\1\3\0019\1\n\0'\3\r\0'\4\14\0B\1\3\0019\1\n\0'\3\15\0'\4\16\0B\1\3\0019\1\n\0'\3\17\0'\4\18\0B\1\3\0019\1\n\0'\3\19\0'\4\20\0B\1\3\1K\0\1\0T<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>\17<leader>tdbg5<cmd>lua require('neotest').summary.toggle()<cr>\15<leader>tsB<cmd>lua require('neotest').output.open({ enter = true })<cr>\15<leader>toP<cmd>lua require('neotest').run.run({env = require('utils.envs').envs})<cr>\15<leader>tnd<cmd>lua require('neotest').run.run({vim.fn.expand('%'), env = require('utils.envs').envs})<cr>\15<leader>tf\rnnoremap\nutils\radapters\1\0\0\bdap\1\0\1\vrunner\vpytest\1\0\1\15justMyCode\1\19neotest-python\nsetup\fneotest\frequire\3ÄÄ¿ô\4\0", "config", "neotest")

vim.cmd [[ packadd cmp-buffer ]]
vim.cmd [[ packadd cmp_luasnip ]]
vim.cmd [[ packadd cmp-path ]]
vim.cmd [[ packadd cmp-cmdline ]]
vim.cmd [[ packadd cmp-nvim-lsp ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeOpen lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Trouble lua require("packer.load")({'trouble.nvim'}, { cmd = "Trouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSInstall lua require("packer.load")({'nvim-treesitter'}, { cmd = "TSInstall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSInstallInfo lua require("packer.load")({'nvim-treesitter'}, { cmd = "TSInstallInfo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSUpdate lua require("packer.load")({'nvim-treesitter'}, { cmd = "TSUpdate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TodoLocList lua require("packer.load")({'todo-comments.nvim'}, { cmd = "TodoLocList", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TodoTrouble lua require("packer.load")({'todo-comments.nvim'}, { cmd = "TodoTrouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'vim-multiple-cursors', 'Comment.nvim', 'nvim-lspconfig'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'nvim-treesitter'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
