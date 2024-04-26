return {
  'stevearc/aerial.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require('aerial').setup({
      backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" }
    })

    vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
  end,
}
