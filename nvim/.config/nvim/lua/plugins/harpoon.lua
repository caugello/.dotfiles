--local harpoon = require('harpoon')
local map = require('../utils').map

local opts = { noremap = true }
map('n', '<leader>hm', ':lua require("harpoon.mark").add_file()<cr>', opts)
map('n', '<leader>hl', ':lua require("harpoon.ui").toggle_quick_menu()<cr>', opts)
for i=1, 9 do
  map('n', string.format('<leader>h%d', i), string.format(":lua require('harpoon.ui').nav_file(%d)<cr>", i), opts)
  map('n', string.format('<leader>t%d', i), string.format(":lua require('harpoon.term').gotoTerminal(%d)<cr>", i), opts)
end
