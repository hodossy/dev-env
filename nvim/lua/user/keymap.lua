local file_nav = require("user.utils.file_navigation")

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { desc = "Select window to the top" })
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { desc = "Select window to the bottom" })
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { desc = "Select window to the left" })
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { desc = "Select window to the right" })

-- clear highlight with Esc
vim.keymap.set("n", "<Esc>", ":let @/=''<CR>", { desc = "Clear highlight" })

-- sorting
vim.keymap.set("v", "<F5>", ":sort<CR>", { desc = "Sort highlighted lines" })

-- buffer handling
vim.keymap.set("n", "<leader>nb", ":enew", { desc = "Open new empty buffer" })

-- navigation between related files
vim.keymap.set("n", "<leader>oc", file_nav.open_related_file_by_ext("ts"), { desc = "Open related code file" })
vim.keymap.set("n", "<leader>oh", file_nav.open_related_file_by_ext("html"), { desc = "Open related template file" })
vim.keymap.set(
	"n",
	"<leader>ot",
	file_nav.open_related_file_by_type_ext("spec", "ts"),
	{ desc = "Open related test file" }
)
vim.keymap.set("n", "<leader>os", file_nav.open_related_file_by_ext("scss"), { desc = "Open related style file" })
vim.keymap.set(
	"n",
	"<leader>oe",
	file_nav.open_related_file_by_type_ext("theme", "scss"),
	{ desc = "Open related theme file" }
)
vim.keymap.set(
	"n",
	"<leader>or",
	file_nav.open_related_file_by_type_ext("stories", "ts"),
	{ desc = "Open related StoryBook file" }
)
