vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.showmode = false
vim.opt.relativenumber = true
vim.o.number = true
vim.o.cursorline = true
vim.o.termguicolors = true
vim.o.shell = "/usr/bin/fish"

-- Highlight on yank
vim.cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = true}")

-- Term mode no numbers
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})
