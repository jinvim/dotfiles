return {
  -- themes
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        -- ...
      })
      vim.cmd.colorscheme("github_dark_default")
      vim.cmd.highlight("Normal guibg=None ctermbg=None")
      vim.cmd.highlight("NormalNC guibg=None ctermbg=None")
      vim.cmd.highlight("EndOfBuffer guibg=None ctermbg=None")
      vim.cmd.highlight("NormalFloat guibg=None ctermbg=None")
      vim.cmd.highlight("NvimTreeNormal guibg=None ctermbg=None")
      vim.cmd.highlight("NvimTreeNormal guibg=None ctermbg=None")
    end,
  },
}
