return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ignore_install = {},
      ensure_installed = {},
      highlight = {
        enable = true,
        disable = { "stata" },
        additional_vim_regex_highlighting = {
          "vimdoc",
          "luadoc",
          "vim",
          "lua",
          "markdown",
        },
      },
      indent = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
      auto_install = true,
    },
  },
}
