return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local map = require("caugello.core.utils").map
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
  end,
}
