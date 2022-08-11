
vim.opt.expandtab = true 
vim.opt.smartindent = true 
vim.opt.relativenumber = true 
vim.opt.nu = true 
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.hidden = true 
vim.opt.errorbells = false 
vim.opt.wrap = false 
vim.opt.swapfile = false 
vim.opt.backup = false 
vim.opt.undofile = true 
vim.opt.incsearch = true 
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

vim.opt.tabstop = 4 
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"
vim.opt.cmdheight = 1
vim.opt.updatetime = 50
vim.opt.shortmess:append("c")

vim.diagnostic.config({
  virtual_text = false,
})

vim.g.mapleader = " "
