return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  opts = {
    integrations = {
      aerial = true,
      mason = true,
      neotree = true,
      telescope = true,
      treesitter = true,
      which_key = true,
    },
  },
  config = function()
    vim.cmd.colorscheme "catppuccin-mocha"
  end
}
