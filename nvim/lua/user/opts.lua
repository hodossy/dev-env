-- VIM options

vim.g.mapleader = "-"
vim.g.maplocalleader = "á"

-- Tab settings
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Editor settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Whitespace
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", trail = "·", nbsp = "␣", eol = "¬" }

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")
