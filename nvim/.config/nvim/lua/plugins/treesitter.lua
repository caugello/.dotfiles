require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'typescript', 'help', 'vim' },

  highlight = { enable = true },
  indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['<leader>po'] = '@parameter.outer',
        ['<leader>pi'] = '@parameter.inner',
        ['<leader>fo'] = '@function.outer',
        ['<leader>fi'] = '@function.inner',
        ['<leader>co'] = '@class.outer',
        ['<leader>ci'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ['<leader>f]'] = '@function.outer',
        ['<leader>c]'] = '@class.outer',
      },
      goto_next_end = {
        ['<leader>F]'] = '@function.outer',
        ['<leader>C]'] = '@class.outer',
      },
      goto_previous_start = {
        ['<leader>[f'] = '@function.outer',
        ['<leader>[c'] = '@class.outer',
      },
      goto_previous_end = {
        ['<leader>[F'] = '@function.outer',
        ['<leader>[C'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    }
  }
}
