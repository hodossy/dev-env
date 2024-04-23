return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      filesytem = {
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
    })

    -- open neo-tree on startup
    vim.api.nvim_create_autocmd("VimEnter", {
      pattern = "*",
      group = vim.api.nvim_create_augroup("NeotreeOnOpen", { clear = true }),
      once = true,
      callback = function(_)
        vim.cmd("Neotree")
      end,
    })

    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
    vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
  end,
}
