-- VIM options

vim.g.mapleader = ","
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
vim.opt.scrolloff = 20

-- Whitespace
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", trail = "·", nbsp = "␣", eol = "¬" }

-- Undo
vim.opt.undofile = true

-- Fold options
vim.opt.fillchars = [[fold: ,foldopen:,foldsep: ,foldclose:]]
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99 -- all folds open by default
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.colorcolumn = "121"

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.timeout = true
vim.opt.timeoutlen = 300

-- enable system clipboard for wsl
if vim.fn.has("wsl") then
	vim.g.clipboard = {
		name = "WslClipboard",
		copy = {
			["+"] = "clip.exe",
			["*"] = "clip.exe",
		},
		paste = {
			["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		},
		cache_enabled = 0,
	}
end

-- spellcheck
vim.opt.spell = true
