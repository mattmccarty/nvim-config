--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader          = ","
vim.g.localleader        = "\\"
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- Show whitespace characters
vim.wo.list              = true
vim.wo.listchars         = 'space:.,tab:>-,trail:~,extends:>,precedes:<'


-- IMPORTS
require('plug') -- Vim-Plug
require('vars') -- Variables
require('opts') -- Options
require('pack') -- Packer (Package manager)
require('keys') -- Keybindings

local is_wsl = (function() 
  local output = vim.fn.systemlist "uname -r" 
  return not not string.find(output[1] or "", "WSL")
end)()
  
-- CLIPBOARD
-- https://github.com/equalsraf/win32yank/releases
if is_wsl then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf"
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf"
    },
    cache_enable = 0,
  }
end

-- THEME SETUP
-- https://github.com/navarasu/onedark.nvim
require('onedark').setup {
  highlights = {
    ["Comment"] = {fg = '#999999'},
  }
}
require('onedark').load()

-- TREE SETUP
-- https://github.com/nvim-tree/nvim-tree.lua
require("nvim-tree").setup()

-- TABS<A-,>
-- https://github.com/romgrk/barbar.nvim
require'bufferline'.setup {
  animation = true,
  icons     = true,
  auto_hide = true,
  tabpages  = true,
  closable  = true,
  clickable = true,
}

-- Align tabs correctly when using the nvim-tree plugin.
-- https://github.com/romgrk/barbar.nvim#usage
local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline.api')

local function get_tree_size()
  return require'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('Resize', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('TreeClose', function()
  bufferline_api.set_offset(0)
end)

-- STATUSBAR
-- https://github.com/ojroques/nvim-hardline
require('hardline').setup {}

-- SCROLLBAR
-- https://github.com/petertriho/nvim-scrollbar
require("scrollbar").setup()

-- COMMAND AUTOCOMPLETION
-- https://github.com/gelguy/wilder.nvim
local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})

-- KEYBINDING HINTS
-- https://github.com/folke/which-key.nvim
local wk = require("which-key")
wk.register()
