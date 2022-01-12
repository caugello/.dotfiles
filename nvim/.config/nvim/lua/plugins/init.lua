local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.vim/plugged')
-- Add plugins
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'onsails/lspkind-nvim'
Plug 'tami5/lspsaga.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-path'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug ('tzachar/cmp-tabnine', {['do'] = './install.sh'})
Plug 'SirVer/ultisnips'
Plug 'rafamadriz/friendly-snippets'
Plug 'artanikin/vim-synthwave84'
Plug 'folke/trouble.nvim'
Plug ('glepnir/galaxyline.nvim', {['branch'] = 'main'})
Plug 'kyazdani42/nvim-web-devicons' -- status line icons
Plug 'kyazdani42/nvim-tree.lua'
Plug ('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'abecodes/tabout.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'voldikss/vim-floaterm'
Plug 'ryanoasis/vim-devicons'
vim.call('plug#end')

require('lsp')
require('plugins.telescope')
require('plugins.completion')
require('plugins.webdev-icons')
require('plugins.statusline')
require('plugins.treesitter')
require('plugins.trouble')
require('plugins.saga')
require('plugins.tree')
require('plugins.gitsigns')
require('plugins.autopairs')
require('plugins.indent')
require('plugins.harpoon')
require('plugins.tabout')
require('plugins.floaterm')
