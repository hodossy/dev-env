return {
  "catgoose/nvim-colorizer.lua",
  event = "VeryLazy",
  opts = {
    lazy_load = true,
    user_default_options = {
      css = true,
      css_fn = true,
      sass = { enable = true, parsers = { "css" } },
    },
  },
}
