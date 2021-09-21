local map = require('utils').map

-- disable dead keys
map('n', '<Up>', '<Nop>', { noremap = true, silent = true })
map('n', '<Down>', '<Nop>', { noremap = true, silent = true })
map('n', '<Left>', '<Nop>', { noremap = true, silent = true })
map('n', '<Right>', '<Nop>', { noremap = true, silent = true })
map('i', '<Up>', '<Nop>', { noremap = true, silent = true })
map('i', '<Down>', '<Nop>', { noremap = true, silent = true })
map('i', '<Left>', '<Nop>', { noremap = true, silent = true })
map('i', '<Right>', '<Nop>', { noremap = true, silent = true })
map('n', 'Q', '<Nop>', { noremap = true, silent = true })
map('n', '<C-z>', '<Nop>', { noremap = true, silent = true })

-- keep visual selection when indenting
map('v', '<', '<gv', { noremap = true, silent = true })
map('v', '>', '>gv', { noremap = true, silent = true })

-- Move lines
map('v', 'K', ":m'>+<CR>gv=gv", {noremap = true})
map('n', 'J', ":m-2<CR>==", {noremap = true})
map('n', 'K', ":m+<CR>==", {noremap = true})
map('v', 'J', ":m-2<CR>gv=gv", {noremap = true})

-- deal with clipboard
map('n', '<Leader>y', '"+y')
map('v', '<Leader>y', '"+y')
map('n', '<Leader>p', '"+p')
map('v', '<Leader>p', '"+p')
map('n', '<Leader>P', '"+P')
