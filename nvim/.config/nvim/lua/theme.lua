local apply_globals = require('utils').apply_globals

local name = 'synthwave84'
apply_globals({
  colors_name = name,
})
vim.api.nvim_command('syntax enable')
vim.api.nvim_command('colorscheme ' .. name)
