vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", "<C-c>", '"+y') -- Copy
vim.keymap.set("n", "<C-v>", '"+p') -- Paste normal mode
vim.keymap.set("i", "<C-v>", '<ESC>"+pla') -- Paste insert mode