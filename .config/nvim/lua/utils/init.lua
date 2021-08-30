local M = {}

function M.map(mode, key, cmd, opt, defaults)
  opts = vim.tbl_deep_extend("force", { silent = true }, defaults or {}, opts or {})
  return vim.api.nvim_set_keymap(mode, key, cmd, opts)
end

function M.nmap(key, cmd, opts)
  return M.map("n", key, cmd, opts)
end
function M.vmap(key, cmd, opts)
  return M.map("v", key, cmd, opts)
end
function M.xmap(key, cmd, opts)
  return M.map("x", key, cmd, opts)
end
function M.imap(key, cmd, opts)
  return M.map("i", key, cmd, opts)
end
function M.omap(key, cmd, opts)
  return M.map("o", key, cmd, opts)
end
function M.smap(key, cmd, opts)
  return M.map("s", key, cmd, opts)
end

function M.nnoremap(key, cmd, opts)
  return M.map("n", key, cmd, opts, { noremap = true })
end
function M.vnoremap(key, cmd, opts)
  return M.map("v", key, cmd, opts, { noremap = true })
end
function M.xnoremap(key, cmd, opts)
  return M.map("x", key, cmd, opts, { noremap = true })
end
function M.inoremap(key, cmd, opts)
  return M.map("i", key, cmd, opts, { noremap = true })
end
function M.onoremap(key, cmd, opts)
  return M.map("o", key, cmd, opts, { noremap = true })
end
function M.snoremap(key, cmd, opts)
  return M.map("s", key, cmd, opts, { noremap = true })
end

return M
