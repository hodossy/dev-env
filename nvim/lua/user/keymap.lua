-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { desc = "Select window to the top" })
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { desc = "Select window to the bottom" })
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { desc = "Select window to the left" })
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { desc = "Select window to the right" })

-- clear highlight with Esc
vim.keymap.set("n", "<Esc>", ":let @/=''<CR>", { desc = "Clear highlight" })

-- sorting
vim.keymap.set("v", "<F5>", ":sort<CR>", { desc = "Sort highlighted lines" })
