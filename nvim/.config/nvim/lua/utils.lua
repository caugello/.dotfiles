local M = {}

-- Map keys
function M.map(mode, key, fn, opts)
  vim.api.nvim_set_keymap(mode, key, fn, opts or {})
end

-- Apply options
function M.apply_options(opts)
  for k, v in pairs(opts) do vim.opt[k] = v end
end

-- Apply globals (let g:)
function M.apply_globals(globals)
  for k, v in pairs(globals) do vim.g[k] = v end
end

return M
