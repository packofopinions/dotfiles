--- VimPlug ----------------------------

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdtree'

Plug 'nvim-lua/plenary.nvim'

Plug 'folke/todo-comments.nvim'

Plug('nvim-telescope/telescope.nvim', {['branch'] = '0.1.x'})
Plug('nvim-telescope/telescope-fzf-native.nvim', {['do'] = 'make'})

vim.call('plug#end')


--- Plugins configurations -------------
require('plugins.configs.ale')
require('plugins.configs.indent-line')
require('plugins.configs.nerd-tree')
require('plugins.configs.telescope')
require('plugins.configs.todo-comments')
