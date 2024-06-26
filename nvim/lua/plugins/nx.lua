return {
  {
    "Equilibris/nx.nvim",

    dependencies = {
      "nvim-telescope/telescope.nvim",
    },

    opts = {
      -- See below for config options
      nx_cmd_root = "npx nx",
    },

    -- Plugin will load when you use these keys
    keys = {
      { "<leader>nxa", "<cmd>Telescope nx actions<CR>",    desc = "Nx actions" },
      { "<leader>nxg", "<cmd>Telescope nx generators<CR>", desc = "Nx generators" },
    },
  },
}
