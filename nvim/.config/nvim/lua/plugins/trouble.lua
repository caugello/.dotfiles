local map = require('../utils').map
require('trouble').setup {}

local opts = {
  noremap = true
}

map('n', '<F12>', '<cmd>TroubleToggle<cr>', opts)
map('v', '<F12>', '<cmd>TroubleToggle<cr>', opts)
map('i', '<F12>', '<cmd>TroubleToggle<cr>', opts)
