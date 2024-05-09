return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  opts = {
    integrations = {
      aerial = true,
      cmp = true,
      gitsigns = true,
      illuminate = true,
      indent_blankline = { enabled = true },
      mason = true,
      mini = true,
      neotree = true,
      telescope = true,
      treesitter = true,
      which_key = true,
    },
  },
  config = function()
    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
