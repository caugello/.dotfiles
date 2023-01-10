local map = require('.utils').map
require('yode-nvim').setup({})

map('v', '<leader>yc', '<cmd>:YodeCreateSeditorFloating<CR>', { noremap = false, silent = true })
map('n', '<leader>yc', '<cmd>:YodeCreateSeditorFloating<CR>', { noremap = false, silent = true })
