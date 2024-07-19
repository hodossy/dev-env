return {
  "stevearc/aerial.nvim",
  opts = {},
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("aerial").setup({
      backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
    })
  end,
  keys = {
    { "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Aerial toggle" },
  },
}
