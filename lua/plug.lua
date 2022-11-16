-- For using vim-plug with Lua and Neovim

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugin/vim-plug')

Plug 'hashivim/vim-terraform'

vim.call('plug#end')
