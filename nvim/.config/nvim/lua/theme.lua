local apply_globals = require('utils').apply_globals

local name = 'catppuccin'
apply_globals({
  colors_name = name,
})
vim.api.nvim_command('syntax enable')
vim.api.nvim_command('colorscheme ' .. name)
