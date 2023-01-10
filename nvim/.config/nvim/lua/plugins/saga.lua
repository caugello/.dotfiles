local saga = require('lspsaga')
local map = require('../utils').map

saga.init_lsp_saga()

local opts = { noremap = true }
map('n', '<leader>ls', ':Lspsaga hover_doc<cr>', opts)
map('n', '<leader>lj', ':Lspsaga diagnostic_jump_next<cr>', opts)
map('n', '<leader>lk', ':Lspsaga diagnostic_jump_prev<cr>', opts)
map('n', '<leader>lr', ':Lspsaga rename<cr>', opts)
map('n', '<leader>lp', ':Lspsaga preview_definition<cr>', opts)
map('n', '<leader>la', ':CodeActionMenu<CR>', opts)
map('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
