-- Bind options
local bind = vim.keymap.set

-- Leader
vim.g.mapleader = ' '

-- Move into splits
bind('n', '<leader><up>', '<C-w><up>')
bind('n', '<leader><down>', '<C-w><down>')
bind('n', '<leader><right>', '<C-w><right>')
bind('n', '<leader><left>', '<C-w><left>')
