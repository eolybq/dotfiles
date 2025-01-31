vim.g.mapleader = " "
vim.g.maplocalleader = ","
-- So leader doesnt move cursor
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>')

-- Clear search
vim.keymap.set("n", "<leader>l", ":nohlsearch<CR>")

-- Exit term mode esc
vim.keymap.set('t', '<Esc>', "<C-\\><C-n>")

-- Yank and P from os reg
vim.keymap.set("v", "<C-c>", '"+y') -- Copy
vim.keymap.set("n", "<C-v>", '"+p') -- Paste normal mode
vim.keymap.set("i", "<C-v>", '<ESC>"+pla') -- Paste insert mode
