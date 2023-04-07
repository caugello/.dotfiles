local apply_options = require('utils').apply_options
local apply_globals = require('utils').apply_globals

apply_globals({
  mapleader = " "
})

apply_options({
  tabstop = 2,
  softtabstop = 2,
  exrc = true,
  hidden = true,
  errorbells = false,
  shiftwidth = 2,
  expandtab = true,
  smartindent = true,
  nu = true,
  relativenumber = true,
  wrap = false,
  undodir = '~/.vim/undodir',
  encoding = 'utf-8',
  hlsearch = false,
  swapfile = false,
  scrolloff = 8,
  signcolumn = 'yes:1',
  colorcolumn = '140',
  termguicolors = true,
  showmode = false,
  completeopt = { 'menuone', 'noinsert', 'noselect' },
  cmdheight = 2,
  updatetime = 50,
  fileencoding = 'utf-8',
  guicursor = 'n-v-c-sm:block,i-ci-ve:ver50-Cursor,r-cr-o:hor50',
  background = 'dark',
})

vim.api.nvim_command('filetype plugin on')
vim.api.nvim_command('autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript')
-- Execute tslint and refresh file. Takes a bit of time to refresh.
-- autocmd BufWritePost *.ts silent exec "!frontend/node_modules/.bin/prettier --config frontend/.prettierrc -w %:p"
vim.api.nvim_command([[
augroup TsLint
autocmd BufWritePost *.ts silent exec "Prettier"
autocmd FocusGained *.ts e!
augroup END
]])
vim.api.nvim_command('autocmd FileType typescript,lua set colorcolumn=140')
vim.api.nvim_command('autocmd FileType python set colorcolumn=79')
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
