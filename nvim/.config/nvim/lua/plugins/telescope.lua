local map = require('../utils').map
local telescope = require('telescope')
telescope.setup({
  defaults = { file_ignore_patterns = {"node_modules", "^.git"} },
  pickers = {
    find_files = {
      hidden = true
    },
    live_grep = {
      hidden = true
    }
  }
})

local opts = {
  noremap = true
}

map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
map('n', '<leader>fh', "<cmd>lua require'telescope.builtin'.help_tags()<cr>", opts)

map('n', '<leader>gs', '<cmd>Telescope git_status<cr>', opts)
map('n', '<leader>gc', '<cmd>Telescope git_commits<cr>', opts)
map('n', '<leader>gb', '<cmd>Telescope git_branches<cr>', opts)
map('n', '<leader>gt', '<cmd>Telescope git_stash<cr>', opts)
