local map = require('../utils').map

opts = {
  noremap = true
}

map('n', '<leader>bb', '<cmd>:NvimTreeToggle<cr>', opts)
map('n', '<leader>br', '<cmd>:NvimTreeRefresh<cr>', opts)
map('n', '<leader>bf', '<cmd>:NvimTreeFindFile<cr>', opts)
